require 'rails_helper'

describe 'org/organizations' do
  before do
    @other_organization = create :organization
    @user = create :user
    @users_organization = create :organization
    create :user_organization_administrator, user: @user, organization: @users_organization
    login_user @user
  end

  describe 'index' do
    before do
      visit org_organizations_path
    end

    it 'should show organization with link that user is a member of' do
      within('table > tbody > tr > td:nth-child(1)') do
        expect(page).to have_xpath("//a[@href='#{org_organization_path(@users_organization)}']", text: @users_organization.name)
      end
    end
    it 'should not show organization that user is not a member of' do
      expect(page).not_to have_xpath("//a[@href='#{org_organization_path(@other_organization)}']", text: @other_organization.name)
    end
    it 'should show user is an administrator of the organization with link to org/users#show' do
      within('table > tbody > tr > td:nth-child(2)') do
        expect(page).to have_xpath("//a[@href='#{org_user_path(@user)}']", text: "#{@user.first_name} #{@user.last_name} (Administrator)")
      end
    end
    it 'should show other organization information' do
       within('table > tbody > tr') do
         expect(page).to have_content(@users_organization.street)
         expect(page).to have_content(@users_organization.city)
         expect(page).to have_content(@users_organization.state)
         expect(page).to have_content(@users_organization.postal_code)
         expect(page).to have_content(@users_organization.contact_name)
         expect(page).to have_content(@users_organization.contact_email)
         expect(page).to have_content(@users_organization.contact_phone)
         expect(page).to have_content(OrganizationPresenter.new(@users_organization).create_date)
       end
    end
  end

  describe 'show' do
    it 'should contain details about the organization' do
      visit org_organization_path(@users_organization)
    end
    it 'should show an edit link if user is administrator' do
      pending 'feature doesnt exist yet'
    end
    it 'should not show an edit link if user is trial secretary' do
      pending 'feature doesnt exist yet'
    end
  end

  describe 'edit' do
    it 'should allow administrator to modify organization data' do
      pending 'feature doesnt exist yet'
    end
    it 'should not allow trial secretary to modify organization data' do
      pending 'feature doesnt exist yet'
    end
  end

end
