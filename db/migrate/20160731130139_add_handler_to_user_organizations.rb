class AddHandlerToUserOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_organizations, :handler, :boolean, default: false
  end
end
