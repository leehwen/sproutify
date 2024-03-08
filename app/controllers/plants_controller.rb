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

end
