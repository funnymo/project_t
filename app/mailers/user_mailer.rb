class UserMailer < ApplicationMailer
	 default from: 'trailproject4@gmail.com'
 
  def registration_confirmation(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: "#{user.fullname} <#{user.email}>", subject: 'Welcome to Trail Site')
  end
end
