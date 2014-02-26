class PayGroupsController < ApplicationController

  def index
    @sort_by = params[:sort_by] || 'name'
    order_by = @sort_by.downcase
    order_by = 'created_at' if order_by == 'created'


    @pgs = PayGroup.order(order_by)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pgs }
      format.csv { send_data PayGroup.order(:name).to_csv }
    end

  end

  def show
    @pg = PayGroup.find(params[:id])    
    @farms = Farm.find_all_by_payGroup_id(@pg.id)  
  end

  def new
    @pg = PayGroup.new
  end

  def edit
    @pg = PayGroup.find(params[:id])
  end

  def create
    @pg = PayGroup.create!(params[:pay_group])
    flash[:notice] = "#{@pg.name} was successfully created."
    redirect_to pay_groups_path
  end

  def update
    @pg = PayGroup.find params[:id]
    @pg.update_attributes!(params[:pay_group])
    flash[:notice] = "#{@pg.name} was successfully updated."
    redirect_to pay_group_path(@pg)
  end

  def destroy
    @pg = PayGroup.find(params[:id])
    @pg.destroy
    flash[:notice] = "Pay Group '#{@pg.name}' deleted."
    redirect_to pay_groups_path
  end

  def import
    if params[:file]
      PayGroup.import(params[:file])
      redirect_to pgs_path, notice: "Products imported."
    else
      flash[:notice] = "No file selected to import"
      redirect_to pgs_path
    end
  end
end
