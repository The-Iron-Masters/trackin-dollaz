namespace :mailer do
  desc "test welcome email"
  task welcome: :environment do
    UserMailer.welcome_email(User.find(1)).deliver_later
  end
end
