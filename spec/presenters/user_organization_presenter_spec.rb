require 'rails_helper'

describe UserOrganizationPresenter do

  before do
    @user_organization = build :user_organization
  end

  describe '.user_name_with_membership' do
    it "should return the user's first and last name with 'Administrator' in parenthesis" do
      @user_organization.administrator = true
      expect(UserOrganizationPresenter.new(@user_organization).user_name_with_membership).to eq "#{@user_organization.user.first_name} #{@user_organization.user.last_name} (Administrator)"
    end

    it "should return the user's first and last name with 'Trial Secretary' in parenthesis" do
      expect(UserOrganizationPresenter.new(@user_organization).user_name_with_membership).to eq "#{@user_organization.user.first_name} #{@user_organization.user.last_name} (Trial Secretary)"
    end
  end

  describe '.organization_name_with_membership' do
    it "should return the organization's name with 'Administrator' in parenthesis" do
      @user_organization.administrator = true
      expect(UserOrganizationPresenter.new(@user_organization).organization_name_with_membership).to eq "#{@user_organization.organization.name} (Administrator)"
    end

    it "should return the user's first and last name with 'Trial Secretary' in parenthesis" do
      expect(UserOrganizationPresenter.new(@user_organization).organization_name_with_membership).to eq "#{@user_organization.organization.name} (Trial Secretary)"
    end
  end

end
