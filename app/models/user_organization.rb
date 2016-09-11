class UserOrganization < ApplicationRecord

  belongs_to :user
  belongs_to :organization

  delegate :name, prefix: true, to: :organization
  delegate :first_name, :last_name, prefix: true, to: :user

  scope :manager, -> { where("administrator = true or trial_secretary = true") }
  scope :handler, -> { where(handler: true) }

end
