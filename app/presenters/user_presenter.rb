class UserPresenter < SimpleDelegator

  delegate :user_organizations, to: :user

  def user
    __getobj__
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def confirmed?
    user.confirmed_at.present? ? 'Yes' : 'No'
  end

  def locked?
    locked_at.present? ? 'Yes' : 'No'
  end

  def create_date
    created_at.strftime('%d/%m/%Y')
  end

  def user_organization_presenters
    user_organizations.inject([]) { |a, uo| a << UserOrganizationPresenter.new(uo); a }
  end

end
