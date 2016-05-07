require 'rails_helper'

describe UserPresenter do

  before do
    @user = create :user
  end

  describe '.create_date' do
    it 'should return created_at formatted as dd/mm/yyyy' do
      expect(UserPresenter.new(@user).create_date).to eq @user.created_at.strftime('%d/%m/%Y')
    end
  end

  describe '.user_organization_presenters' do
    it 'should return empty array if no user organizations' do
      expect(UserPresenter.new(@user).user_organization_presenters).to be_blank
    end

    it 'should return array of user organization presenters' do
      user_organization = create :user_organization_trial_secretary, user: @user
      user_organization_presenters = UserPresenter.new(@user).user_organization_presenters
      expect(user_organization_presenters.count).to eq 1
      expect(user_organization_presenters.first.attributes).to eq UserOrganizationPresenter.new(user_organization).attributes
    end
  end

end
