class CpsController < ApplicationController

  def index
    @cps = Cp.all
  end

  def show
    @cp = Cp.find(params[:id])    
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

end
