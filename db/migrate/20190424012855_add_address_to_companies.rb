class AddAddressToCompanies < ActiveRecord::Migration[5.2]
  def change
    if Rails.env.development?
      add_reference :companies, :address, foreign_key: true
    end
  end
end
