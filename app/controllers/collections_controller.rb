class CollectionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[destroy]

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    @collection.save! if @collection.valid?

    respond_to do |format|
      # format.html { redirect_to plants_path }
      format.json
    end

    authorize @collection
  end

  def show
    @collection = Collection.find(params[:id])
    @plants = @collection.plants

    authorize @collection
  end

  def destroy
    @collection = Collection.find(params[:id])

    @collection.destroy

    redirect_to plants_path, alert: "Collection has been deleted"

    authorize @collection
  end

  def add_plant
    @collection = Collection.find(params[:id])
    @plants = current_user.plants.where(collection_id: nil)

    authorize @collection
  end

  def update
    @collection = Collection.find(params[:id])
    plant_ids = params[:collection][:plant_ids]
    cleaned_plant_id = plant_ids.reject { |id| id.empty? }
    cleaned_plant_id.each do |id|
      plant_find = Plant.find(id)
      plant_find.collection_id = @collection.id
      plant_find.save
    end

    redirect_to collection_path(@collection)
    
    authorize @collection
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :image)
  end
end
