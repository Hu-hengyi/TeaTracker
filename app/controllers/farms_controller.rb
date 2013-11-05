class FarmsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @sort_by = params[:sort_by] || 'Report Date'
    order_by = @sort_by.downcase
    order_by = "updated_at" if order_by == 'report date'
    @farms = Farm.all(:order => order_by)
    @csv_farms = Farm.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farms }
      format.csv { send_data @csv_farms.to_csv }
    end
  end

  def show
    @farm = Farm.find(params[:id])    
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
    Farm.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end
end