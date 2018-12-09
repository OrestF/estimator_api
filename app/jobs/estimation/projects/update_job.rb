class Estimation::Projects::UpdateJob < ApplicationJob
  queue_as :default

  def perform(params)
    Estimation::Projects::Update.call(Project.find(params[:project_id]), params.except(:project_id))
  end
end
