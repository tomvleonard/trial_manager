require 'rails_helper'

describe 'admin/users' do
  before do
    login_as create(:admin), scope: :admin
    @user = create :user
    @organization = create :organization
    create :user_organization_administrator, user: @user, organization: @organization
  end

  describe 'index' do
    before do
      visit admin_users_path
    end

    it 'should show user first name' do
      expect(page).to have_content(@user.first_name)
    end

    it 'should show user last name' do
      expect(page).to have_content(@user.last_name)
    end

  end

end
