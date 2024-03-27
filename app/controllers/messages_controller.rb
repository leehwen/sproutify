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
        sender: current_user.id,
        message: render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      redirect_to chat_offer_path(@offer), alert: @message.errors.messages.values[0][0]
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
