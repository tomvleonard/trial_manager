class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.timestamps
    end
  end
end
