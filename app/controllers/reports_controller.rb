class ReportsController < ApplicationController
  before_action :set_policy
  before_action :set_report, only: %i[show destroy]

  def show
    crud_response(@report) # TODO: with tasks
  end

  def create
    crud_response(Estimation::Reports::Create.call(create_report_params))
  end

  def destroy
    crud_response(Estimation::Reports::Destroy.call(@report))
  end

  private

  def create_report_params
    hash = params.require(:report).permit(:tech, :project_id)
    hash[:user_id] = current_user.id
    hash
  end

  def set_report
    @report = organization.reports.find(params[:id])

    custom_authorize(@report, organization: organization)
  end

  def set_project
    @project = organization.projects.find(params[:project_id])
  end

  def set_policy
    @policy_class = Estimation::Reports::Policy
  end
end
