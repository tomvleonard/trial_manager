class Admin::OrganizationsController < AdminController

  def index
    @organization_presenters = Organization.includes(user_organizations: :user).order(:name).inject([]) { |a, o| a << OrganizationPresenter.new(o); a }
  end

end
