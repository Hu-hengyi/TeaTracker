class DepositsController < ApplicationController
  skip_before_filter :authenticate_user_from_token! if Rails.env.test?

  # GET /deposits
  # GET /deposits.json
  respond_to :html, :json
  def index
    @sort_by = params[:sort_by] || 'Created'
    order_by = @sort_by.downcase
    order_by = "created_at" if order_by == 'created'
    order_by = "farm_id" if order_by == "farm"
    order_by = "cp_id" if order_by == "collection point"

#controller for time window filter
    if (params.has_key?("deposit_f"))
      @weighed_from = Date.new(params["deposit_f"]["weighed_from(1i)"].to_i,params["deposit_f"]["weighed_from(2i)"].to_i,params["deposit_f"]["weighed_from(3i)"].to_i).to_datetime
    else
      @weighed_from = Deposit.minimum - 1.days - 5.hours #need to subtract a day here so to include all deposits by default
    end
    if (params.has_key?("deposit_t"))
      @weighed_to = Date.new(params["deposit_t"]["weighed_to(1i)"].to_i,params["deposit_t"]["weighed_to(2i)"].to_i,params["deposit_t"]["weighed_to(3i)"].to_i).to_datetime
    else
      @weighed_to= Deposit.maximum
    end

#controller for bracket calculations
    @farm_totals = Hash.new
    @farm_deps = Hash.new
    @cut_a = 7
    @cut_b = 10

#controller for pay group filter
    @all_groups_filter = false
    @val_groups = ""
    @vis_groups = ""
    if params.has_key?(:pay_group_filter) and params[:pay_group_filter] != ""
      @val_groups = params[:pay_group_filter]
      @vis_groups = @val_groups.split(", ")
    else
      @all_groups_filter = true
    end
    @all_groups = PayGroup.pluck(:name).join(",")
    @deposits = Deposit.find(:all, :conditions => ["weighed_at > ? AND weighed_at <= ?", @weighed_from +1.days, @weighed_to+1.days], :order => order_by) #will limit deposits to a given time window


#export csv
    @csv_deposits = Deposit.order(:weighed_at)
    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: @deposits}
      format.csv {send_data @csv_deposits.to_csv}
    end
  end

  # GET /deposits/1
  # GET /deposits/1.json
  def show
    @deposit = Deposit.find(params[:id])
    respond_with(@deposit) if request.xhr?
  end

  # GET /deposits/new
  # GET /deposits/new.json
  def new
    @deposit = Deposit.new
    respond_with(@deposit) if request.xhr?
  end

  # GET /deposits/1/edit
  def edit
    @deposit = Deposit.find(params[:id])
  end

  # POST /deposits
  # POST /deposits.json
  def create
    @deposit = Deposit.new(params[:deposit])
    if @deposit.save
      flash[:notice] = "Deposit was successfully created."
      redirect_to deposits_path
    else
      render :new
    end
  end

  # PUT /deposits/1
  # PUT /deposits/1.json
  def update
    @deposit = Deposit.find(params[:id])
    if @deposit.update_attributes(params[:deposit])
      flash[:notice] = "Deposit was successfully updated."
      redirect_to deposit_path(@deposit)
    else
      render action: 'edit'
    end
  end

  # DELETE /deposits/1
  # DELETE /deposits/1.json
  def destroy
    @deposit = Deposit.find(params[:id])
    @deposit.destroy
    flash[:notice] = "Deposit deleted."
    redirect_to deposits_path
  end

  def resolve
    deposit = Deposit.find(params[:id])
    deposit.possible_duplicate = false
    deposit.save!
    redirect_to deposits_path
  end

  def import
    if params[:file]
      Deposit.import(params[:file])
      redirect_to deposits_path, notice: "Products imported."
    else
      flash[:notice] = "No file selected to import"
      redirect_to deposits_path
    end
  end
end
