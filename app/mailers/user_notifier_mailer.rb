class UserNotifierMailer < ApplicationMailer

  default from: 'noreply@sharespace.com'

  def send_signup_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Share Space!')
  end

  def send_listing_creation_email(user)
    @user = user
    mail(to: @user.email, subject: 'You made a listing!')
  end
end
