class OffersController < ApplicationController
  before_action :skip_authorization

  def new
    @offer = Offer.new
    @buyer_plants = current_user.plants.where(listing: true)
  end

  def create
    @offer = Offer.new(offer_params)

    @lister_plant = Plant.find(params[:id])
    @offer.lister_plant = @lister_plant

    @lister = @lister_plant.user
    @offer.lister = @lister

    @offer.buyer = current_user
    @offer.save
  end

  def chat
    @offer = Offer.find(params[:id])
    @messages = @offer.messages
    @message = Message.new
  end

  def accepted
    @offer = Offer.find(params[:id])
    @offer.accepted = true

    @lister_plant = @offer.lister_plant
    @buyer_plant = @offer.buyer_plant

    @lister_plant_user = @offer.lister
    @buyer_plant_user = @offer.buyer

    @lister_plant.user = @buyer_plant_user
    @buyer_plant.user = @lister_plant_user
    authorize @offer # need to authorise this
  end

  private

  def offer_params
    params.require(:offer).permit(:buyer_plant_id)
  end
end
