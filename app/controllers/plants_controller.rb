class PlantsController < ApplicationController
  def index
    @plants = Plant.all.where(user: current_user)
    @collections=Collection.all.where(user: current_user)
    @collection = Collection.new
    @plants = policy_scope(Plant)
    @collections= policy_scope(Collection)
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to plants_path
    else
      render :new, status: :unprocessable_entity
    end

    authorize @plant
  end

  def show
    @plant = Plant.find(params[:id])
    @plantinfo = PlantInfo.find(@plant.plant_info_id)
    @illnesses = @plant.illnesses
    authorize @plant
  end

  def edit
    @plant = Plant.find(params[:id])

    authorize @plant
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(collection_params)

    redirect_to  plants_path

    authorize @plant
  end

  def add_diagnosis
    @plant = Plant.find(params[:plant_id])
    @illness = Illness.find(params[:illness_id])
    pi = PlantIllness.find_or_initialize_by(plant: @plant, illness: @illness)
    authorize @plant
    pi.save
    redirect_to plant_path(@plant)
  end

  def remove_diagnosis
    @plant = Plant.find(params[:plant_id])
    @illness = Illness.find(params[:illness_id])
    pi = PlantIllness.find_by(plant: @plant, illness: @illness)
    authorize @plant
    pi.destroy
    redirect_to plant_path(@plant)
  end

  def listings
    @listings = Plant.where(listing: true)
    authorize @listings
  end

  def listing
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update_listing
    @plant = Plant.find(params[:id])
    @plant.listing = true # needs to be updated based on checkbox status plant_listing_controller.js
    authorize @plant
  end

  def offering_option
    @plant = Plant.find(params[:id])
    authorize @plant

    respond_to do |format|
      format.text { render partial: "plants/offering_option", locals: {plant: @plant}, formats: [:html] }
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:nickname, :remarks, :plant_info_id, :image)
  end

  def collection_params
    params.require(:plant).permit(:collection_id)
  end

end
