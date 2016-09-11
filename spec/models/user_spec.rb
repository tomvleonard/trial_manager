require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create :user
    @organization = create :organization
    @user_organization = create :user_organization, user: @user, organization: @organization
  end

  describe 'associations' do
    it { should have_many :user_organizations }
    it { should have_many(:organizations).through(:user_organizations) }

    describe 'organizations extensions' do
      describe '.manager' do
        it 'should return empty collection if user_organization.administrator and user_organization.trial_secretary are set to false' do
          expect(@user.organizations.manager).to be_empty
        end
        it 'should return organizations where user has user_organization.administrator set to true' do
          @user_organization.update_column(:administrator, true)
          expect(@user.reload.organizations.manager.first).to eq @organization
        end
        it 'should return organizations where user has user_organization.trial_secretary set to true' do
          @user_organization.update_column(:trial_secretary, true)
          expect(@user.reload.organizations.manager.first).to eq @organization
        end
      end
      describe '.handler' do
        it 'should return empty collection if user_organization.handler are set to false' do
          expect(@user.organizations.handler).to be_empty
        end
        it 'should return organizations where user has user_organization.handler set to true' do
          @user_organization.update_column(:handler, true)
          expect(@user.reload.organizations.handler.first).to eq @organization
        end
      end
    end
  end

  [ :first_name, :last_name ].each do |attr|
    it { should validate_presence_of attr }
  end

  describe '.organization_manager?' do
    it 'should return true if user has any user_organization associations where administrator is true' do
      @user_organization.update_column(:administrator, true)
      expect(@user.organization_manager?).to eq true
    end
    it 'should return true if user has any user_organization associations where trial_secretary is true' do
      @user_organization.update_column(:trial_secretary, true)
      expect(@user.organization_manager?).to eq true
    end
    it 'should return false if user has no user_organization associations where administrator or trial_secretary are true' do
      expect(@user.organization_manager?).to eq false
    end
  end

  describe '.handler?' do
    it 'should return true if user has any user_organization associations where handler is true' do
      @user_organization.update_column(:handler, true)
      expect(@user.handler?).to eq true
    end
    it 'should return false if user has no user_organization associations where handler is true' do
      expect(@user.handler?).to eq false
    end
  end

end
