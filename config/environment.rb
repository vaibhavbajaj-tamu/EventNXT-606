# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :port           => 587,
  :address        => "smtp.gmail.com"
  :user_name      => 'tmpemailfortesting@gmail.com',
  :password       => 'simplepassword',
  :domain         => 'yourapp.heroku.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp