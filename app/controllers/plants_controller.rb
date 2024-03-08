class PlantsController < ApplicationController
  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to new_plant_path
    else
      render :new, status: :unprocessable_entity 
    end

    authorize @plant
  end

  private

  def plant_params
    params.require(:plant).permit(:nickname, :remarks, :plant_info_id, :image)
  end

end
