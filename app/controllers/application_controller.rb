class ApplicationController < ActionController::API
  include Pundit
  include ActionController::MimeResponds
  include Serialization
  before_action :authenticate_user!
  respond_to :json

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def custom_authorize(record, configs = {})
    return true if policy_class.new(current_user, record, configs).send("#{action_name}?")

    raise Pundit::NotAuthorizedError, "not allowed to #{action_name} #{record.class.name.humanize}"
  end

  def policy_class
    @policy_class ||= "#{self.class.name.split('::').last.remove('Controller').singularize}Policy".constantize
  end

  def organization
    @organization ||= current_user.try(:organization)
  end

  private

  def user_not_authorized(error)
    render_json({ errors: error }, :forbidden)
  end
end
