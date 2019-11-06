class AttendanceMailer < ApplicationMailer
  def welcome_attendee(user)
    @user = user

    @url = 'https://monsite.com/event'

    mail(to:@user.event.admin.email, subject: 'Un nouveau participant !')
  end
end
