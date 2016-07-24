class UserOrganizationPresenter < SimpleDelegator

  delegate :user, :organization, to: :user_organization

  def user_organization
    __getobj__
  end

  def user_name_with_membership
    "#{user.first_name} #{user.last_name} (#{membership})"
  end

  def user_full_name
    "#{user.first_name} #{user.last_name}"
  end

  def organization_name_with_membership
    "#{organization.name} (#{membership})"
  end

  def membership
    self.administrator? ? 'Administrator' : 'Trial Secretary'
  end

end
