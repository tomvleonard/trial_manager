class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :lockable

  has_many :user_organizations
  has_many :organizations, through: :user_organizations do
    def manager
      where("user_organizations.administrator = true or user_organizations.trial_secretary = true")
    end
    def handler
      where("user_organizations.handler = true")
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true

  def organization_manager?
    user_organizations.manager.any?
  end

  def handler?
    user_organizations.handler.any?
  end
end
