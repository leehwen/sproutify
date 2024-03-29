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
    @plants = @collection.plants.includes(%i[image_attachment plant_info])

    authorize @collection
  end

  def destroy
    @collection = Collection.find(params[:id])

    @collection.destroy

    redirect_to plants_path, alert: "Collection has been deleted"

    authorize @collection
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :image)
  end
end
