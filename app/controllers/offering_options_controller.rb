class OfferingOptionsController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    redirect_to offer_offering_options_view_path(@offer) if @offer.offering_options.length.positive?
    @offering_option = OfferingOption.new
    @plants = current_user.plants.where(listing: true).includes(%i[image_attachment plant_info])
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
      # format.json { render json: { status: :ok } }
      format.json { render json: { message: :ok }, status: :ok }
      # format.json { render json: {params:}}
    end
  end

  def view
    @offer = Offer.find(params[:offer_id])
    authorize @offer
    @offering_option = @offer.offering_options
  end
end
