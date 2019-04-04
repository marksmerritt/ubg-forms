require "rails_helper"

RSpec.describe FormSubmissionMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }
  let(:form) { FactoryBot.create(:form, user: user) }

  describe "#email_form" do 
    it "sends the email" do 
      FormSubmissionMailer.email_form(form, "", form.user).deliver_now

      expect(ActionMailer::Base.deliveries).to_not be_empty
    end
  end
end
