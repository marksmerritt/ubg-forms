class DropFormHeaderFields < ActiveRecord::Migration[5.2]
  def change
    drop_table :form_header_fields
  end
end
