class PlantsController < ApplicationController

  def show
    @plant = Plant.find(params[:id])
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
end
