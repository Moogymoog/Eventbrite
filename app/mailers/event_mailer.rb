class EventMailer < ApplicationMailer
  def email_validation(user)
    @user = user

    @url = 'https://monsite.fr/login'

    mail(to:@user.admin.email, subject: 'Ton événement a bien été validé !')
  end
end
