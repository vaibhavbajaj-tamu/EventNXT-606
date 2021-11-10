# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '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', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'form4s.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}