class TasksController < ApplicationController
  before_action :set_policy

  def search
    custom_authorize(Task)

    @serializer = TaskSerializer
    collection_response(Estimation::Tasks::Search.call(params[:query], params[:tech]).results)
  end

  def show
    custom_authorize(Task)
    crud_response(Task.find(params[:id]), :with_marks)
  end

  private

  def set_policy
    @policy_class = Estimation::Tasks::Policy
  end
end
