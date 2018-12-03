class ReportTasksController < ApplicationController
  before_action :set_policy
  before_action :set_report_task, only: %i[update destroy]

  def create
    custom_authorize(ReportTask, report_id: params[:report_task][:report_id])

    crud_response(Estimation::ReportTasks::Create.call(create_report_tasks_params))
  end

  def update
    crud_response(Estimation::ReportTasks::Update.call(@report_task, update_report_tasks_params))
  end

  def destroy
    crud_response(Estimation::ReportTasks::Destroy.call(@report_task))
  end

  private

  def create_report_tasks_params
    hash = params.require(:report_task).permit(:name, :optimistic, :pessimistic, :task_id, :report_id, :description)
    hash[:user_id] = current_user.id
    hash
  end

  def update_report_tasks_params
    params.require(:report_task).permit(:optimistic, :pessimistic, :task_id, :description)
  end

  def set_report_task
    @report_task = ReportTask.find(params[:id])

    custom_authorize(@report_task, report_id: params[:report_id])
  end

  def set_policy
    @policy_class = Estimation::ReportTasks::Policy
  end
end
