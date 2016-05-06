class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :lockable

  has_many :user_organizations
  has_many :organizations, through: :user_organizations

  validates :first_name, presence: true
  validates :last_name, presence: true

end
