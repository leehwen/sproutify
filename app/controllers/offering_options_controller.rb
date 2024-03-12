class OfferingOptionsController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    @offering_option = OfferingOption.new
    @plants = current_user.plants.where(listing: true)
    @offering_option.offer_id = @offer.id

    authorize @plants
  end

  def create
    raise
  end



end
