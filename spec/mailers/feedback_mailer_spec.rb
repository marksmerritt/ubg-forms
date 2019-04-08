require "rails_helper"

RSpec.describe FeedbackMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }
  let(:feedback) { FactoryBot.create(:feedback, user: user) }

  describe "#email_feedback" do 
    it "sends the email" do 
      FeedbackMailer.email_feedback(user, feedback).deliver_now

      expect(ActionMailer::Base.deliveries).to_not be_empty
    end
  end
end