class CollectionsController < ApplicationController

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

    redirect_to plants_path

    authorize @collection
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :image)
  end
end
