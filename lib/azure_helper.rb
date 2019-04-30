# TODO: Refactor!

require "pdf_generator"

module AzureHelper
  def self.create_client_instance
    Azure::Storage::Blob::BlobService.create(storage_account_name: ENV["AZURE_STORAGE_ACCOUNT"],
                                             storage_access_key: ENV["AZURE_STORAGE_ACCESS_KEY"])
  end

  def self.generate_dir(form)
    "#{form.form_type.name.gsub(' ', '-').downcase!}s"
  end

  def self.generate_filename(form:, dir:, content_type:, index: nil)
    company_name = form.company.name.gsub(' ', '-').downcase!
    directory = form.is_a?(FormUpload) ? "#{dir}/uploaded--" : "#{dir}/"
    base = "#{company_name}/" + directory + "job##{form.job_number}--#{form.created_at.strftime('%Y-%m-%d')}--#{form.id}"

    case content_type
      when "form"
        base += "/form" 
      when "image"
        base += ("/image" + "#{index + 1}")
      else
        base += "/unk"
    end

    base
  end

  def self.send_form(form)
    client = create_client_instance
    container = set_container_name
    dir = generate_dir(form)
    filename = generate_filename(form: form, dir: dir, content_type: "form")
    content = PdfGenerator.generate(form)

    client.create_block_blob(container, filename, content)
    send_images_with_form(client, form, container, dir) if form.images.attached?
    send_failure_email(form, content) if form.has_failures?
  end

  def self.send_uploaded_form(form_upload)
    client = create_client_instance
    container = set_container_name
    dir = generate_dir(form_upload)
    filename = generate_filename(form: form_upload, dir: dir, content_type: "form") 
    binary_content = form_upload.form.download

    client.create_block_blob(container, filename, binary_content)
  end

  def self.delete_form(filename, img_count)
    client = create_client_instance
    container = set_container_name
    
    client.delete_blob(container, filename)
    delete_images(filename, img_count, client, container) if img_count > 0
  end

  def self.delete_uploaded_form(filename)
    client = create_client_instance
    container = set_container_name
    
    client.delete_blob(container, filename)
  end

  def self.set_container_name
    ENV["AZURE_CONTAINER_NAME"]
  end

  def self.send_failure_email(form, content)
    # TODO: Uncomment
    # Don't send emails with fake data
    # FormSubmissionMailer.email_form(form, content).deliver_now
  end

  def self.send_images_with_form(client, form, container, dir)
    form.images.each_with_index do |img, index|
      img_binary = img.download

      filename = generate_filename(form: form, dir: dir, content_type: "image", index: index) 
      client.create_block_blob(container, filename, img_binary)
    end
  end

  def self.delete_images(filename, img_count, client, container)
    image_filename = filename[0..-5] + "image"
    
    img_count.times do |i|
      client.delete_blob(container, (image_filename + "#{i + 1}"))
    end
  end
end
    

    
    

    