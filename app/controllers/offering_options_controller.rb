class OfferingOptionsController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    @offering_option = OfferingOption.new
    @plants = current_user.plants.where(listing: true)
    @offering_option.offer_id = @offer.id

    authorize @plants
  end

  def create
    @offer = Offer.find(params[:offer_id])
    authorize @offer

    @plants = params[:ids]

    @plants.each do |plant_id|
      @plant = Plant.find(plant_id)
      @offering_option = OfferingOption.new(plant: @plant)
      @offer.offering_options << @offering_option
    end

    respond_to do |format|
      format.json { head :ok }
    end
  end
end
