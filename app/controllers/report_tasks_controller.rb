class ReportTasksController < ApplicationController
  before_action :set_policy
  before_action :set_report_task, only: %i[show destroy]

  def create
    crud_response(Estimation::ReportTasks::Create.call(create_report_tasks_params))
  end

  private

  def create_report_tasks_params
    params.require(:report_task).permit(:name, :optimistic, :pessimistic, :task_id, :report_id, :description)
  end

  def set_report_task
    @report = organization.reports.find(params[:id])

    custom_authorize(@report, report_id: params[:report_id])
  end

  def set_policy
    @policy_class = Estimation::ReportTasks::Policy
  end
end
