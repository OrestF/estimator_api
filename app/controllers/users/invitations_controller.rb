class Users::InvitationsController < Devise::InvitationsController
  include Pundit
  include Serialization
  respond_to :json

  def create
    custom_authorize(nil)

    crud_response(User.invite!({ email: params[:email] }, current_user))
  end

  def edit
    crud_response(User.find_by_invitation_token(params[:invitation_token], true), :invitation)
  end

  def update
    user = User.find_by_invitation_token(params[:invitation_token], true)
    render_json({ errors: { invitation_token: ['Invalid token'] } }, :bad_request) && return if user.blank?

    user.apply_invitation(params[:password])

    crud_response(user.reload)
  end

  private

  def policy_class
    Staff::Organizations::InvitationPolicy
  end
end
