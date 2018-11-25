require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Invitations' do
  header 'Content-Type', 'application/json'
  header 'Accept', 'application/json'

  post '/users/invitation' do
    with_options with_example: true do
      parameter :email, required: true
    end

    context 'when params are correct' do
      let!(:manager) { create(:manager) }
      let(:headers) { auth_headers(manager) }
      let(:params) { { email: 'new_user@mail.com' } }

      it 'Invite user to current organization by email' do
        expect(ActionMailer::Base.deliveries.size).to eq 0
        expect(User.count).to eq 1

        do_request

        expect(response_status).to eq 200
        expect(json['email']).to eq params[:email]
        expect(User.count).to eq 2
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end
    end

    let(:raw_post) { params.to_json }
  end

  put '/users/invitation' do
    with_options with_example: true do
      parameter :invitation_token, required: true
      parameter :password, required: true
    end

    context 'when params are correct' do
      let!(:manager) { create(:manager) }
      let(:email)  { Faker::Internet.email }
      let(:params) { { password: 'password' } }

      before do
        user = User.invite!({ email: email }, manager) { |u| u.skip_invitation = true }
        params[:invitation_token] = user.raw_invitation_token
      end

      it 'Add password and accept invitation' do
        expect(User.count).to eq 2

        do_request

        expect(response_status).to eq 200
        expect(json['email']).to eq email
        expect(User.find_by_email(json['email']).organization_id).to eq manager.organization_id
      end
    end

    let(:raw_post) { params.to_json }
  end
end
