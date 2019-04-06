require 'rails_helper'

RSpec.describe FormUpload, type: :model do
  describe "creation" do 
    it "attaches the form" do 
      # Testing image files here (instead of PDFs) because the assumption is 
      # that if a hard copy is filled out, workers will take a photo and upload
      # it to the app...which will then be stored in Azure in the same dir structure
      # as PDF versions.
      form_img = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')

      expect {
        FactoryBot.create(:form_upload, form: form_img)
      }.to change(ActiveStorage::Attachment, :count).by(1)
    end
  end
end
