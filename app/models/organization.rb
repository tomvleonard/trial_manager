class Organization < ApplicationRecord

  has_many :user_organizations
  has_many :users, through: :user_organizations

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :contact_name, presence: true
  validates :contact_email, presence: true
  validates :contact_phone, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true

end
