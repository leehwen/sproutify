class BuddiesController < ApplicationController

  def index
    @buddies = Buddy.all.where(user: current_user)
    @buddy = Buddy.new

    @buddies = policy_scope(Buddy)
  end

  def create
    @buddy = Buddy.new(buddy_params)
    @buddy.user = current_user
    @buddy.save!

    redirect_to buddies_path
  end

  def send_schedule
    @buddy = Buddy.find(params[:id])

    BuddyScheduleMailer.with(buddy: @buddy, user: current_user).schedule_mail.deliver_now

    flash[:success] = "Thank you for your order! We'll get contact you soon!"
    redirect_to plants_path
    
    authorize @buddy
  end

  private

  def buddy_params
    params.require(:buddy).permit(:email, :name, :hp)
  end
end
