class Admin::UsersController < AdminController

  def index
    @user_presenters = User.includes(user_organizations: :organization).order(:last_name, :first_name).inject([]) { |a, u| a << UserPresenter.new(u); a }
  end

end
