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

    if @buddy.save
      redirect_to buddies_path
    else
      render :index, status: :unprocessable_entity
    end

    authorize @buddy
  end

  def send_schedule
    @buddy = Buddy.find(params[:id])

    BuddyScheduleMailer.with(buddy: @buddy, user: current_user).schedule_mail.deliver_later

    redirect_to plants_path, notice: "Schedule sent to #{@buddy.name}"
    
    authorize @buddy
  end

  private

  def buddy_params
    params.require(:buddy).permit(:email, :name, :hp)
  end
end
