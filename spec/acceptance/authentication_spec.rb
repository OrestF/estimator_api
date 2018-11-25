require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  header 'Content-Type', 'application/json'
  header 'Accept', 'application/json'

  post 'users/sign_in' do
    with_options scope: :user, with_example: true do
      parameter :email, required: true
      parameter :password, required: true
      # add domain here
    end

    context 'when params are correct' do
      let(:user) { create(:user) }
      let(:params) { { user: { email: user.email, password: user.password } } }

      it 'Sign in with correct email and password' do
        do_request

        expect(response_status).to eq 201
        expect(response_headers['Authorization']).to be_present
      end
    end

    context 'when login params are incorrect' do
      let(:params) { { user: { email: 'wrong@email.com', password: 'wrongpassword' } } }

      it 'returns unathorized status', document: false do
        do_request

        expect(response_status).to eq 401
      end
    end

    let(:raw_post) { params.to_json }
  end

  delete '/users/sign_out' do
    let(:params) { {} }

    it 'Sign out doesn\'t require any params' do
      do_request

      expect(response_status).to eq 204
    end
  end
end
