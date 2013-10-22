class FarmsController < ApplicationController
  # GET /farms
  # GET /farms.json
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

  # GET /farms/1
  # GET /farms/1.json
  def show
    @farm = Farm.find(params[:id])

    respond_to do |format|
      #  format.html
      #  format.json { render json: @farm }
      format.csv { render text: @farms.to_csv }
    end
    
  end

  # GET /farms/new
  # GET /farms/new.json
  def new
    @farm = Farm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @farm }
    end
  end

  # GET /farms/1/edit
  def edit
    @farm = Farm.find(params[:id])
  end

  # POST /farms
  # POST /farms.json
  def create
    @farm = Farm.new(params[:farm])

    respond_to do |format|
      if @farm.save
        format.html { redirect_to @farm, notice: 'Farm was successfully created.' }
        format.json { render json: @farm, status: :created, location: @farm }
      else
        format.html { render action: "new" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /farms/1
  # PUT /farms/1.json
  def update
    @farm = Farm.find(params[:id])

    respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, notice: 'Farm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy

    respond_to do |format|
      format.html { redirect_to farms_url }
      format.json { head :no_content }
    end
  end

  def import
    Farm.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
