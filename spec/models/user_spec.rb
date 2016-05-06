require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many :user_organizations }
  it { should have_many(:organizations).through(:user_organizations) }

  [ :first_name, :last_name ].each do |attr|
    it { should validate_presence_of attr }
  end

end
