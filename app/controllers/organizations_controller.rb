class OrganizationsController < ApplicationController
  before_action :set_policy
  before_action :set_organization, only: %i[show update destroy members]

  def index
    custom_authorize(Organization)

    collection_response(Organization.all)
  end

  def show
    crud_response(@organization)
  end

  def create
    custom_authorize(Organization)

    crud_response(Staff::Organizations::Create.call(organization_params))
  end

  def update
    crud_response(Staff::Organizations::Update.call(@organization, organization_params))
  end

  def destroy
    crud_response(Staff::Organizations::Destroy.call(@organization))
  end

  def members
    collection_response(@organization.users)
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def set_organization
    @organization = Organization.find(params[:id])

    custom_authorize(@organization)
  end

  def set_policy
    @policy_class = Staff::Organizations::Policy
  end
end
