class Rabbitmq::Producers::ProjectsBriefJob < ApplicationJob
  queue_as :producers

  def perform(project)
    Rabbitmq::Producers::ProjectsBrief.call(project)
  end
end
