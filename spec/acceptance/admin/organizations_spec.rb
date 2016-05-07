require 'rails_helper'

describe 'admin/organizations' do
  before do
    login_as create(:admin), scope: :admin
    @user = create :user
    @organization = create :organization
    @organization_presenter = OrganizationPresenter.new(@organization)
    create :user_organization_administrator, user: @user, organization: @organization
  end

  describe 'index' do
    before do
      visit admin_organizations_path
    end

    it 'should show organization name' do
      expect(page).to have_content(@organization_presenter.name)
    end

    it 'should show member names with membership type' do
      user_organization_presenter = @organization_presenter.user_organization_presenters.first
      expect(page).to have_content(user_organization_presenter.user_name_with_membership)
    end

    it 'should show street' do
      expect(page).to have_content(@organization_presenter.street)
    end

    it 'should show city' do
      expect(page).to have_content(@organization_presenter.city)
    end

    it 'should show state' do
      expect(page).to have_content(@organization_presenter.state)
    end

    it 'should show postal code' do
      expect(page).to have_content(@organization_presenter.postal_code)
    end

    it 'should show contact name' do
      expect(page).to have_content(@organization_presenter.contact_name)
    end

    it 'should show contact email' do
      expect(page).to have_content(@organization_presenter.contact_email)
    end

    it 'should show contact phone' do
      expect(page).to have_content(@organization_presenter.contact_phone)
    end

    it 'should show create date' do
      expect(page).to have_content(@organization_presenter.create_date)
    end

  end
end
