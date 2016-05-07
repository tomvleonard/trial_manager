class OrganizationPresenter < SimpleDelegator

  delegate :user_organizations, to: :organization

  def organization
    __getobj__
  end

  def create_date
    organization.created_at.strftime('%d/%m/%Y')
  end

  def user_organization_presenters
    user_organizations.inject([]) { |a, uo| a << UserOrganizationPresenter.new(uo); a }
  end
end
