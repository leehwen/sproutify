class MessagesController < ApplicationController
  def create
    @offer = Offer.find(params[:offer_id])
    @message = Message.new(message_params)
    @message.offer = @offer
    @message.user = current_user
    authorize @message
    if @message.save
      OfferChannel.broadcast_to(
        @offer,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render chat_offer_path(@offer), status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
