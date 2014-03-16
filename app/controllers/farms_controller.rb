class FarmsController < ApplicationController
  def index
    @sort_by = params[:sort_by] || 'Name'
    order_by = @sort_by.downcase
    order_by = "bushes" if order_by == 'fertilizer'

#search parameters/group filter ver 1
=begin
    if params[:search]
      @farms = Farm.where(name: params[:search])
    else
      @paygroups = Hash.new
      PayGroup.all.each do |paygroup|
        @paygroups[paygroup.id] = "1"
      end
      if params.has_key?(:paygroups)
        @paygroups = params[:paygroups]
      elsif session.has_key?(:paygroups)
        @paygroups = session[:paygroups]
        redirect = true
      end
      @farms = Farm.where("paygroup_id in (?)", @paygroups.keys).order(order_by)
    end
=end

#controller for pay group filter
    @table_groups = []
    @all_groups_filter = false
    @vis_groups = ""
    if params.has_key?(:pay_group_filter) and params[:pay_group_filter] != ""
      @vis_groups = params[:pay_group_filter].split(", ")
      @vis_groups.each do |group_name|
        temp = PayGroup.find_by_name(group_name)
        if temp != nil
          @table_groups << temp
        end
      end
    else
      @all_groups_filter = true
    end
    @all_groups = PayGroup.pluck(:name).join(",")
    if @all_groups_filter
      @farms = Farm.order(order_by)
    else
      @farms = Farm.where("paygroup_id in (?)", @table_groups).order(order_by)
    end


#total bushes calculations
    @bush_sum = 0
    @farms.each { |farm| @bush_sum += (farm.bushes || 0) }

#export feature
    @csv_farms = Farm.order(:name)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farms }
      format.csv { send_data @csv_farms.to_csv }
    end
  end

  def show
    @farm = Farm.find(params[:id])
    @deposits = Deposit.find_all_by_farm_id(@farm.id)
    @yield = 0
    @deposits.each { |deposit| @yield += (deposit.weight || 0) }
    @yield = @yield - (@yield % 0.001)
  end

  def new
    @farm = Farm.new
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def create
    @farm = Farm.create!(params[:farm])
    flash[:notice] = "#{@farm.name} was successfully created."
    redirect_to farms_path
  end

  def update
    @farm = Farm.find params[:id]
    @farm.update_attributes!(params[:farm])
    flash[:notice] = "#{@farm.name} was successfully updated."
    redirect_to farm_path(@farm)
  end

  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy
    flash[:notice] = "Farm '#{@farm.name}' deleted."
    redirect_to farms_path
  end

  def import
    if params[:file]
      Farm.import(params[:file])
      redirect_to root_url, notice: "Products imported."
    else
      flash[:notice] = "No file selected to import"
      redirect_to farms_path
    end
  end

  def shadow
    @image = File.open(File.join(Rails.root, '/app/assets/images/leaf-shadow.png'))
  end
end
