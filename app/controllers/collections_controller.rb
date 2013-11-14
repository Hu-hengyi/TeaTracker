class CollectionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id]) 
  end

  def new
    @collection = Collection.new
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.create!(params[:collection])
    flash[:notice] = "#{@collection.name} was successfully created."
    redirect_to collections_path
  end

  def update
    @collection = Collection.find params[:id]
    @collection.update_attributes!(params[:collection])
    flash[:notice] = "#{@collection.name} was successfully updated."
    redirect_to collections_path(@collection)
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    flash[:notice] = "Collection '#{@collection.name}' deleted."
    redirect_to collections_path
  end

end
