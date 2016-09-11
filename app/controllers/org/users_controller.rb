class Org::UsersController < OrgController

  def dashboard
    @user = current_user
  end

end
