class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[share]

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
    @plant.save! if @plant.valid?

    respond_to do |format|
      format.json
    end


    # if @plant.save
    #   redirect_to plants_path
    # else
    #   render :new, status: :unprocessable_entity
    # end

    authorize @plant
  end

  def show
    @plant = Plant.find(params[:id])
    @plantinfo = PlantInfo.find(@plant.plant_info_id)
    @illnesses = @plant.illnesses
    # start_date = params.fetch(:start_date, Date.today).to_date
    authorize @plant
  end

  def edit
    @plant = Plant.find(params[:id])
    @collection = Collection.new

    authorize @plant
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    redirect_to plants_path

    authorize @plant
  end

  def edit_schedule
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update_schedule
    @plant = Plant.find(params[:id])
    @plant.update(schedule_params)
    if @plant.save
      redirect_to plant_path, success: "Schedule updated successfully."
    else
      render :edit_schedule, status: unprocessable_entity
    end
    authorize @plant
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(collection_params)

    if @plant.save
      redirect_to plants_path, success: "Plant added to collection."

    else
      render :edit, notice: "Plant not able to be added. Try again"
    end

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
    @listings = Plant.where.not(user: current_user).where(listing: true)

    if params[:query].present?
      @listings = @listings.global_search(params[:query])
    end

    authorize @listings
  end

  def listing
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update_listing
    @plant = Plant.find(params[:id])
    @plant.listing = params[:status]
    authorize @plant
    if @plant.save!
      flash[:alert] = "Listing settings updated"
    else
      flash[:alert] = "Error with listing on Marketplace"
    end

    respond_to do |format|
      format.json { render json: { header: 'ok' } }
      format.html { redirect_to plant_path(@plant) }
    end
  end

  def share
    @user = User.find_by_token(params[:token])
    @plants = @user.plants
    @full_schedule = @plants.map { |plant| plant.schedule(params[:start_date]) }.flatten
    authorize @plants
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
    params.require(:plant).permit(:nickname, :remarks, :plant_info_id, :image, :watering_frequency, :start_date)
  end

  def collection_params
    params.require(:plant).permit(:collection_id)
  end

  def schedule_params
    params.require(:plant).permit(:watering_frequency, :start_date)
  end
end
