require 'rails_helper'

RSpec.describe DeleteFormFromAzureWorker do
  describe "perform async" do 
    it "enqueues a job" do
      DeleteFormFromAzureWorker.perform_async("job#1234--2019-04-05--01")
      expect(DeleteFormFromAzureWorker).to have_enqueued_sidekiq_job("job#1234--2019-04-05--01")
    end
  end
end