class UserOrganizationPresenter < SimpleDelegator

  delegate :user, to: :user_organization

  def user_organization
    __getobj__
  end

  def user_name_with_membership
    "#{user.first_name} #{user.last_name} (#{membership})"
  end

  def membership
    self.administrator? ? 'Administrator' : 'Trial Secretary'
  end

end
