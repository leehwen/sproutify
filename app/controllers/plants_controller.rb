class PlantsController < ApplicationController
  def index
    @plants = Plant.all.where(user: current_user)
    @plants = policy_scope(Plant)
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

  def add_diagnosis
    @plant = Plant.find(params[:plant_id])
    @illness = Illness.find(params[:illness_id])
    @plant.illnesses << @illness
    authorize @plant
    redirect_to plant_path(@plant)
  end

  def listings
    @listings = Plant.where(listing: true)
  end

  def add_listing
    @plant = Plant.find(params[:id])
    @plant.listing = true
    authorize @plant
  end

  private

  def plant_params
    params.require(:plant).permit(:nickname, :remarks, :plant_info_id, :image)
  end

end
