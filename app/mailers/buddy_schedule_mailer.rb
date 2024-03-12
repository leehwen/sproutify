class BuddyScheduleMailer < ApplicationMailer
  def schedule_mail
    @buddy = params[:buddy]
    @user = params[:user]

    mail(to: @buddy.email, subject: "#{@user.username} needs your help to water mi plants!!")
  end
end
