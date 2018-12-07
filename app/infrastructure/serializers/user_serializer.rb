class UserSerializer < ApplicationSerializer
  identifier :id
  fields :email

  view :invitation do
    fields :invitation_token
  end
end
