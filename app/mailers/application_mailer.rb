class ApplicationMailer < ActionMailer::Base
  default from: ENV["DEFAULT_MAILER_SENDER"]
  layout 'mailer'
end
