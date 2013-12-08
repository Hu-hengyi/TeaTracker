class PathingController < ApplicationController
  require 'json'
  before_filter do
    unless current_user.type == "Admin"
      flash[:alert] = "This area is restricted to users with administrator privileges"
      redirect_to farms_path
    end
  end

  @@data = JSON.parse(File.read('/home/saasbook/Lujeri/TeaTracker/config/pathing.json'))

  # GET /users
  # GET /users.json
  def index
    @farms = Farm.all
    @users = @@data
    @data = JSON.parse(File.read('/home/saasbook/Lujeri/TeaTracker/config/pathing.json'))
    @tractors = []
    @data["tractors"].each do |tractor|
      temp = ""
      tractor[1].each do |cp|
        temp << cp
        temp << " -> "
      end
      @tractors << [tractor[0], temp.slice(0,temp.size-4)]
    end
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farms }
    end
  end

end
