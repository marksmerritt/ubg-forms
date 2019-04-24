class AddAddressToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :address, foreign_key: true
  end
end
