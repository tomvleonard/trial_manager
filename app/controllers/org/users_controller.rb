class Org::UsersController < OrgController

  def dashboard
    @user_presenter = UserPresenter.new(current_user)
  end

  def show
    @user_presenter = UserPresenter.new(User.find(params[:id]))
  end

end
