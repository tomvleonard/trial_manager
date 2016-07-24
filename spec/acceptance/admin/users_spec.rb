require 'rails_helper'

describe 'admin/users' do
  before do
    login_as create(:admin), scope: :admin
    @user = create :user
    @user_presenter = UserPresenter.new(@user)
    @organization = create :organization
    create :user_organization_administrator, user: @user, organization: @organization
  end

  describe 'index' do
    before do
      visit admin_users_path
    end

    it 'should show user full name' do
      expect(page).to have_content(@user_presenter.full_name)
    end

    it 'should link to user' do
      expect(page).to have_xpath("//a[@href='#{admin_user_path(@user)}']")
    end

    it 'should show user email' do
      expect(page).to have_content(@user_presenter.email)
    end

    it 'should show organizations with membership type' do
      expect(page).to have_content(@user_presenter.user_organization_presenters.first.organization_name_with_membership)
    end

    it 'should link to organizations' do
      expect(page).to have_xpath("//a[@href='#{admin_organization_path(@organization)}']")
    end

    it 'should show create date' do
      expect(page).to have_content(@user_presenter.full_name)
    end
  end

  describe 'show' do
    before do
      @user.update_attributes sign_in_count: 99,
        current_sign_in_at: Date.today,
        last_sign_in_at: Date.today - 1.day,
        current_sign_in_ip: '1.2.3.4',
        last_sign_in_ip: '5.6.7.8',
        confirmed_at: Date.today - 2.days,
        failed_attempts: 11
      visit admin_user_path(@user)
    end

    it 'should show user details' do
      expect(page).to have_content(@user_presenter.full_name)
      expect(page).to have_content(@user_presenter.email)
      expect(page).to have_content(@user_presenter.sign_in_count)
      expect(page).to have_content(@user_presenter.current_sign_in_at)
      expect(page).to have_content(@user_presenter.last_sign_in_at)
      expect(page).to have_content(@user_presenter.current_sign_in_ip)
      expect(page).to have_content(@user_presenter.last_sign_in_ip)
      expect(page).to have_content(@user_presenter.confirmed?)
      expect(page).to have_content(@user_presenter.failed_attempts)
      expect(page).to have_content(@user_presenter.locked?)
    end

    it 'should show organization names and type of membership' do
      expect(page).to have_content(@user_presenter.user_organization_presenters.first.organization_name)
      expect(page).to have_content(@user_presenter.user_organization_presenters.first.membership)
    end

    it 'should have link to organizations' do
      expect(page).to have_xpath("//a[@href='#{admin_organization_path(@organization)}']")
    end
  end

end
