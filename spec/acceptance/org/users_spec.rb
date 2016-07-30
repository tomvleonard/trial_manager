require 'rails_helper'

describe 'org/users' do
  before do
    @user = create :user
    @user_presenter = UserPresenter.new(@user)
    @organization = create :organization
    create :user_organization_administrator, user: @user, organization: @organization
  end

  it 'should redirect to org/users#dashboard when user logs in' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(current_path).to eq dashboard_path
  end

end
