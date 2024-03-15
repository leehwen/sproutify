class BuddiesController < ApplicationController

  def index
    @buddies = Buddy.all.where(user: current_user)
    @buddy = Buddy.new

    @buddies = policy_scope(Buddy)
  end

  def create
    @buddies = Buddy.all.where(user: current_user)
    @buddy = Buddy.new(buddy_params)
    @buddy.user = current_user
    @buddy.save! if @buddy.valid?

    respond_to do |format|
      # format.html { redirect_to plants_path }
      format.json
    end

    authorize @buddy
  end

  def send_schedule
    @buddy = Buddy.find(params[:id])

    BuddyScheduleMailer.with(buddy: @buddy, user: current_user).schedule_mail.deliver_later

    redirect_to plants_path, success: "Schedule sent to #{@buddy.name}"
    
    authorize @buddy
  end

  def destroy
    @buddy = Buddy.find(params[:id])
    @buddy.destroy

    redirect_to buddies_path, alert: "Buddy successfully deleted"

    authorize @buddy
  end

  private

  def buddy_params
    params.require(:buddy).permit(:email, :name, :hp)
  end
end
