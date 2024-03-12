class MessagesController < ApplicationController
  def create
    @offer = Offer.find(params[:offer_id])
    @message = Message.new(message_params)
    @message.offer = @offer
    @message.user = current_user
    authorize @message
    if @message.save
      redirect_to chat_offer_path(@offer)
    else
      render chat_offer_path(@offer), status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
