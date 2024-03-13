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

  def accept
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.buyer_plant_id = params[:selectedPlantId]
    @offer.accepted = "accepted"
    @offer.save!

    if @offer.save
      # swap the owners of the plants
      @offer.lister_plant.user = @offer.buyer
      @offer.lister_plant.save
      @offer.buyer_plant.user = @offer.lister
      @offer.buyer_plant.save

      # respond back to update the page
      respond_to do |format|
        format.text { render partial: "options",
                      locals: { offer: @offer },
                      formats: [:html]
                    }
      end
    else
      flash.now[:alert] = "Error with accepting the offer"
    end

  end

  def reject
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.update(accepted: "rejected")
    redirect_to offer_path(@offer)
  end

  private

  def offer_params
    params.require(:offer).permit(:buyer_plant_id)
  end
end
