class CpsController < ApplicationController

  def index
    @sort_by = params[:sort_by] || 'name'
    order_by = @sort_by.downcase
    order_by = 'created_at' if order_by == 'created'


    @cps = Cp.order(order_by)
    @cpDetails = Cp.getNumLeaves

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cps }
      format.csv { send_data Cp.order(:name).to_csv }
    end

  end

  def show
    @cp = Cp.find(params[:id])    
    @deposits = Deposit.find_all_by_cp_id(@cp.id)  
  end

  def new
    @cp = Cp.new
  end

  def edit
    @cp = Cp.find(params[:id])
  end

  def create
    @cp = Cp.create!(params[:cp])
    flash[:notice] = "#{@cp.name} was successfully created."
    redirect_to cps_path
  end

  def update
    @cp = Cp.find params[:id]
    @cp.update_attributes!(params[:cp])
    flash[:notice] = "#{@cp.name} was successfully updated."
    redirect_to cp_path(@cp)
  end

  def destroy
    @cp = Cp.find(params[:id])
    @cp.destroy
    flash[:notice] = "Collection Point '#{@cp.name}' deleted."
    redirect_to cps_path
  end

  def import
    if params[:file]
      Cp.import(params[:file])
      redirect_to cps_path, notice: "Products imported."
    else
      flash[:notice] = "No file selected to import"
      redirect_to cps_path
    end
  end
end
