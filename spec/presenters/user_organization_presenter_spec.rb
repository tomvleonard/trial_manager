require 'rails_helper'

describe UserOrganizationPresenter do

  describe '.user_name_with_membership' do

    it "should return the user's first and last name with 'Administrator' in parenthesis" do
      user_organization = build :user_organization_administrator
      expect(UserOrganizationPresenter.new(user_organization).user_name_with_membership).to eq "#{user_organization.user.first_name} #{user_organization.user.last_name} (Administrator)"
    end

    it "should return the user's first and last name with 'Trial Secretary' in parenthesis" do
      user_organization = build :user_organization_trial_secretary
      expect(UserOrganizationPresenter.new(user_organization).user_name_with_membership).to eq "#{user_organization.user.first_name} #{user_organization.user.last_name} (Trial Secretary)"
    end

  end
end
