require 'rails_helper'

describe 'Privileges' do
  before do
    @admin = create :admin
    @user = create :user
  end

  describe 'admins' do
    before do
      login_admin(@admin)
    end

    it 'should have access admin/organizations link in Admin dropdown menu' do
      debugger
      expect(page).to have_xpath("//a[@href='#{admin_organizations_path}']")
    end
    it 'should have access admin/users link in Admin dropdown menu' do
      expect(page).to have_xpath("//a[@href='#{admin_users_path}']")
    end
  end

  describe 'users' do
    before do
      login_user(@user)
    end

    it 'should not have access admin/organizations link in Admin dropdown menu' do
      expect(page).not_to have_xpath("//a[@href='#{admin_organizations_path}']")
    end
    it 'should not have access admin/users link in Admin dropdown menu' do
      expect(page).not_to have_xpath("//a[@href='#{admin_users_path}']")
    end
  end

end
