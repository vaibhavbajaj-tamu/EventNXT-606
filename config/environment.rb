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
