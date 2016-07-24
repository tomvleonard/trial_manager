require 'rails_helper'

describe UserPresenter do
  before do
    @user = create :user
  end

  describe '.full_name' do
    it 'should return the user first and last names' do
      expect(UserPresenter.new(@user).full_name).to eq "#{@user.first_name} #{@user.last_name}"
    end
  end

  describe '.confirmed?' do
    it 'should return Yes if there is a confirmed_at date' do
      @user.confirmed_at = Date.today
      expect(UserPresenter.new(@user).confirmed?).to eq 'Yes'
    end
    it 'should return No if confirmed_at is nil' do
      expect(UserPresenter.new(@user).confirmed?).to eq 'No'
    end
  end

  describe '.locked?' do
    it 'should return Yes if there is a locked_at date' do
      @user.locked_at = Date.today
      expect(UserPresenter.new(@user).locked?).to eq 'Yes'
    end
    it 'should return No if locked_at is nil' do
      expect(UserPresenter.new(@user).locked?).to eq 'No'
    end
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
