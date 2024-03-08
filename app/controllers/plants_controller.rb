class PlantsController < ApplicationController

  def add_diagnosis
    @plant = Plant.find(params[:plant_id])
    @illness = Illness.find(params[:illness_id])
    @plant_illness = PlantIllness.new
    @plant.illnesses << @illness
    redirect_to plant_path(params[:plant_id])
  end

end
