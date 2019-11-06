class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user

    @url = 'https://monsite.fr/login'

    mail(to:@user.email, subject: 'Welcome Moussaillson !')
  end
end
