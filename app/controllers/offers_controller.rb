class OffersController < ApplicationController
  before_action :skip_authorization

  def index
    @offers = policy_scope(Offer)
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def new
    # @offer = Offer.new
    # @buyer_plants = current_user.plants.where(listing: true)
  end

  def create
    @lister_plant = Plant.find(params[:create_offer][:lister_plant_id])
    @lister = @lister_plant.user

    @offer = Offer.new(lister_plant_id: @lister_plant.id, lister_id: @lister.id, accepted: "pending" ,buyer_id: current_user.id)
    if @offer.save
      redirect_to offer_offering_options_new_path(@offer)
    else
      raise
    end
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

  def default_message
    @offer = Offer.find(params[:id])
    @offering_options = OfferingOption.where(offer: @offer)
    content = "I would like to make an offer to #{@offer.lister_plant.nickname}.
    These are plants I would like to swap"
    @default_message = Message.new(content:)
    @default_message.offer = @offer
    @default_message.user = current_user
    authorize @offer
    if @default_message.save
      redirect_to chat_offer_path(@offer)
    else

    end
  end

  private

  def offer_params
    params.require(:offer).permit(:buyer_plant_id)
  end
end
