class Admin::UsersController < AdminController

  def index
    @user_presenters = User.includes(user_organizations: :organization).order(:last_name, :first_name).inject([]) { |a, u| a << UserPresenter.new(u); a }
  end

  def show
    user = User.includes(:user_organizations).where(id: params[:id]).first
    @user_presenter = UserPresenter.new(user)
  end

end
