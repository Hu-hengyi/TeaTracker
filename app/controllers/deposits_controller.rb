class DepositsController < ApplicationController
  # GET /deposits
  # GET /deposits.json
  respond_to :html, :json
  def index
    @sort_by = params[:sort_by] || 'Created'
    order_by = @sort_by.downcase
    order_by = "created_at" if order_by == 'created'
    @deposits = Deposit.all(:order => order_by)

    respond_with(@deposits)
  end

  # GET /deposits/1
  # GET /deposits/1.json
  def show
    @deposit = Deposit.find(params[:id])
    respond_with(@deposit)
  end

  # GET /deposits/new
  # GET /deposits/new.json
  def new
    @deposit = Deposit.new
    respond_with(@deposit)
  end

  # GET /deposits/1/edit
  def edit
    @deposit = Deposit.find(params[:id])
  end

  # POST /deposits
  # POST /deposits.json
  def create
    weight = params[:deposit][:weight]
    quality = params[:deposit][:quality]
    farm_id = params[:deposit][:farm_id]
    @deposit = Deposit.create!(:weight => weight, :quality=> quality)
    @deposit.update_column(:farm_id, farm_id)
    @deposit.save!
    flash[:notice] = "Deposit was successfully created."
    redirect_to deposits_path
  end

  # PUT /deposits/1
  # PUT /deposits/1.json
  def update
    @deposit = Deposit.find(params[:id])
    @deposit = Deposit.find params[:id]
    @deposit.update_attributes!(params[:deposit])
    flash[:notice] = "Deposit was successfully updated."
    redirect_to deposit_path(@deposit)
  end

  # DELETE /deposits/1
  # DELETE /deposits/1.json
  def destroy
    @deposit = Deposit.find(params[:id])
    @deposit.destroy
    flash[:notice] = "Deposit deleted."
    redirect_to deposits_path
  end
end
