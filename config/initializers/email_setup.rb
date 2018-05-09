if Rails.env.development?
  

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USER'],
  :password => ENV['SENDGRID_PASS'],
  :domain => 'coderacademy.edu.au',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

elsif Rails.env.production?

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.sendgrid.net',
  port:                 587,
  domain:               'heroku.com',
  user_name:            ENV["SENDGRID_USERNAME"],
  password:             ENV["SENDGRID_PASSWORD"],
  authentication:       'plain',
  enable_starttls_auto: true
}

end
