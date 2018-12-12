class ProjectsController < ApplicationController
  before_action :set_policy
  before_action :set_project, only: %i[show update destroy]

  def index
    custom_authorize(organization)

    collection_response(organization.projects)
  end

  def show
    crud_response(@project, :full)
  end

  def create
    custom_authorize(Project)
    crud_response(Estimation::Projects::Create.call(project_create_params))
  end

  def update
    crud_response(Estimation::Projects::Update.call(@project, project_update_params))
  end

  def destroy
    crud_response(Estimation::Projects::Destroy.call(@project))
  end

  def assign_estimators
    @project = organization.projects.find(params[:project_id])
    custom_authorize(@project)

    crud_response(Estimation::Projects::AssignEstimators.call(@project, params[:project][:estimator_ids]), :with_estimators)
  end

  def remove_estimators
    @project = organization.projects.find(params[:project_id])
    custom_authorize(@project)

    crud_response(Estimation::Projects::RemoveEstimators.call(@project, params[:project][:estimator_ids]), :with_estimators)
  end

  def reports
    @project = organization.projects.find(params[:project_id])
    custom_authorize(@project, organization: organization)

    collection_response(@project.reports.all)
  end

  private

  def project_create_params
    params.require(:project).permit(:name, :description).merge!(organization_id: organization.id)
  end

  def project_update_params
    params.require(:project).permit(:name, :description, :brief_description).merge!(organization_id: organization.id)
  end

  def set_project
    @project = organization.projects.find(params[:id])

    custom_authorize(@project)
  end

  def set_policy
    @policy_class = Estimation::Projects::Policy
  end
end
