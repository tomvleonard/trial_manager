require 'rails_helper'

describe OrganizationPresenter do

  before do
    @organization = create :organization
  end

  describe '.create_date' do
    it 'should return created_at formatted as dd/mm/yyyy' do
      expect(OrganizationPresenter.new(@organization).create_date).to eq @organization.created_at.strftime('%d/%m/%Y')
    end
  end

  describe '.user_organization_presenter' do
    it 'should return empty array if no user organizations' do
      expect(OrganizationPresenter.new(@organization).user_organization_presenters).to be_blank
    end

    it 'should return array of user organization presenters' do
      user_organization = create :user_organization_trial_secretary, organization: @organization
      user_organization_presenters = OrganizationPresenter.new(@organization).user_organization_presenters
      expect(user_organization_presenters.count).to eq 1
      expect(user_organization_presenters.first.attributes).to eq UserOrganizationPresenter.new(user_organization).attributes
    end
  end

end
