class FarmsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @sort_by = params[:sort_by] || 'Report Date'
    order_by = @sort_by.downcase
    order_by = "updated_at" if order_by == 'report date'
    @csv_farms = Farm.order(:name)

<<<<<<< HEAD
    if params[:search]
      @farms = Farm.where(name: params[:search])
    else
      @farms = Farm.all(:order => order_by)
    end
=======
    @bush_sum = 0
    #@farms.each { |farm| @bush_sum += (farm.bushes || 0) }
>>>>>>> 6f2028d4182e15a704cf89f70ef9aa247dd579c6

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
    if params[:file]
      Farm.import(params[:file])
      redirect_to root_url, notice: "Products imported."
    else
      flash[:notice] = "No file selected to import"
      redirect_to farms_path
    end
  end
end
