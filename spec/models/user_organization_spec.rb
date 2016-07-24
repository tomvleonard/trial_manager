require 'rails_helper'

RSpec.describe UserOrganization, type: :model do

  [ :user, :organization ].each do |assoc|
    it { should belong_to assoc }
  end

  describe 'delegations' do
    it '.organization_name' do
      organization = Organization.new(name: 'This org')
      user_organization = UserOrganization.new(organization: organization)
      expect(user_organization.organization_name).to eq 'This org'
    end

    it '.user_first_name' do
      user = User.new(first_name: 'First')
      user_organization = UserOrganization.new(user: user)
      expect(user_organization.user_first_name).to eq 'First'
    end

    it '.user_last_name' do
      user = User.new(last_name: 'Last')
      user_organization = UserOrganization.new(user: user)
      expect(user_organization.user_last_name).to eq 'Last'
    end
  end

end
