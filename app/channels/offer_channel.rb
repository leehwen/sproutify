class OfferChannel < ApplicationCable::Channel
  def subscribed
    offer = Offer.find(params[:id])
    stream_for offer
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
