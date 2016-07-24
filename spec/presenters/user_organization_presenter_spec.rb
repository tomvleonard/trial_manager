require 'rails_helper'

describe UserOrganizationPresenter do

  before do
    @organization = build :organization
    @user = build :user
    @user_organization = build :user_organization, user: @user, organization: @organization
  end

  describe 'user_full_name' do
    it "should return the user's full name" do
      expect(UserOrganizationPresenter.new(@user_organization).user_full_name).to eq "#{@user.first_name} #{@user.last_name}"
    end
  end

  describe '.user_name_with_membership' do
    it "should return the user's first and last name with 'Administrator' in parenthesis" do
      @user_organization.administrator = true
      expect(UserOrganizationPresenter.new(@user_organization).user_name_with_membership).to eq "#{@user.first_name} #{@user.last_name} (Administrator)"
    end

    it "should return the user's first and last name with 'Trial Secretary' in parenthesis" do
      expect(UserOrganizationPresenter.new(@user_organization).user_name_with_membership).to eq "#{@user.first_name} #{@user.last_name} (Trial Secretary)"
    end
  end

  describe '.organization_name_with_membership' do
    it "should return the organization's name with 'Administrator' in parenthesis" do
      @user_organization.administrator = true
      expect(UserOrganizationPresenter.new(@user_organization).organization_name_with_membership).to eq "#{@organization.name} (Administrator)"
    end

    it "should return the user's first and last name with 'Trial Secretary' in parenthesis" do
      expect(UserOrganizationPresenter.new(@user_organization).organization_name_with_membership).to eq "#{@organization.name} (Trial Secretary)"
    end
  end

end
