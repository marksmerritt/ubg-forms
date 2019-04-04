require 'rails_helper'

RSpec.describe FormToAzureWorker do
  let(:form) { FactoryBot.create(:form) }

  describe "perform async" do 
    it "enqueues a job" do
      FormToAzureWorker.perform_async(form.id)
      expect(FormToAzureWorker).to have_enqueued_sidekiq_job(form.id)
    end
  end
end
