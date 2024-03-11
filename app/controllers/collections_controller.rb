class CollectionsController < ApplicationController
  def new
    @collection = Collection.new

    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    @collection.save!

    authorize @collection

    redirect_to plants_path
  end

  def show
    @collection = Collection.find(params[:id])
    @plants = @collection.plants
    
    authorize @collection
  end

  def destroy
    @collection = Collection.find(params[:id])
    @plants = Plant.all.where(collection_id: @collection.id)
    @plants.each do |plant| plant.collection_id = nil end
    @collection.destroy

    redirect_to plants_path
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :image)
  end
end
