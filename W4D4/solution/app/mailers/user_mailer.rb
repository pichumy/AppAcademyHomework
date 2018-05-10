class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'junkemail@email.com', subject: 'Welcome to My Awesome Site')
  end
end
