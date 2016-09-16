class Org::OrganizationsController < OrgController

  before_action :load_organization, only: [ :show, :edit, :update, :destroy ]

  def index
    @organization_presenters = current_user.organizations.map { |o| OrganizationPresenter.new(o) }
  end

  def show
    @organization_presenter = OrganizationPresenter.new(@organization)
  end

  def edit
  end

  private

    def load_organization
      @organization = Organization.find(params[:id])
    end

end
