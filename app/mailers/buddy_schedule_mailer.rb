class BuddyScheduleMailer < ApplicationMailer
  def schedule_mail
    @buddy = params[:buddy]
    @user = params[:user]

    mail(to: @buddy.email, subject: "#{@user.first_name + " " + @user.last_name} needs your help to water his/her plants!!")
  end
end
