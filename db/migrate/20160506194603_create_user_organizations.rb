class CreateUserOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_organizations do |t|
      t.integer :user_id
      t.integer :organization_id
      t.boolean :administrator
      t.boolean :trial_secretary
      t.timestamps
    end
  end
end
