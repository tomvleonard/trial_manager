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

  describe 'scopes' do
    before do
      @user_organization = create :user_organization
    end

    describe '.manager' do
      it 'should return empty collection if no user organizations where administrator or trial_secretary is true' do
        expect(UserOrganization.manager).to be_empty
      end
      it 'should return user organization collection where administrator is true' do
        @user_organization.update_column(:administrator, true)
        expect(UserOrganization.manager).to eq [ @user_organization ]
      end
      it 'should return user organization collection where trial_secretary is true' do
        @user_organization.update_column(:trial_secretary, true)
        expect(UserOrganization.manager).to eq [ @user_organization ]
      end
    end
    describe '.handler' do
      it 'should return empty collection if no user organizations where handler is true' do
        expect(UserOrganization.handler).to be_empty
      end
      it 'should return user organization collection where handler is true' do
        @user_organization.update_column(:handler, true)
        expect(UserOrganization.handler).to eq [ @user_organization ]
      end
    end
  end

end
