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
    @deposits = Deposit.all(:order => order_by)
    @csv_deposits = Deposit.order(:weighed_at)
    @groupA = 0
    @groupB = 0
    @groupC = 0
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
