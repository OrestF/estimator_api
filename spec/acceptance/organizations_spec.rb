require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Organizations' do
  let(:admin) { create(:admin) }

  get '/organizations' do
    let!(:organizations) { create_list(:organization, 3) }
    let(:admin) { create(:admin, organization: organizations.last) }

    context 'as admin' do
      let(:headers) { auth_headers(admin) }

      it 'Get organizations list' do
        do_request

        expect(response_status).to eq 200
        expect(json.size).to eq 3
      end
    end
  end

  get '/organizations/:id' do
    let!(:organization) { create(:organization) }
    let!(:id) { organization.id }

    context 'as admin' do
      let(:headers) { auth_headers(admin) }

      it 'Get organization' do
        do_request

        expect(response_status).to eq 200
        expect(json['name']).to eq organization.name
      end
    end
  end

  post '/organizations' do
    with_options with_example: true do
      parameter :name, required: true
    end

    context 'as admin' do
      let(:headers) { auth_headers(admin) }

      context 'with required params' do
        let(:params) { { name: 'New name' } }

        it 'Create organization' do
          do_request

          expect(response_status).to eq 200
          expect(json['name']).to eq params[:name]
        end
      end

      context 'without required params' do
        let(:params) { { name: nil } }

        it 'returns error response', document: false do
          do_request

          expect(response_status).to eq 400
          expect(json['errors']).to be_present
        end
      end
    end

    let(:raw_post) { params.to_json }
  end

  put '/organizations/:id' do
    with_options with_example: true do
      parameter :name, required: false
    end

    let!(:id) { create(:organization).id }

    context 'as admin' do
      let(:headers) { auth_headers(admin) }

      context 'with required params' do
        let(:params) { { name: 'New name' } }

        it 'Update organization' do
          do_request

          expect(response_status).to eq 200
          expect(json['name']).to eq params[:name]
          expect(json['errors']).to_not be_present
        end
      end

      context 'without required params' do
        let(:params) { { name: nil } }

        it 'returns error response', document: false do
          do_request

          expect(response_status).to eq 400
          expect(json['errors']).to be_present
        end
      end
    end

    let(:raw_post) { params.to_json }
  end

  get '/organizations/:id/members' do
    parameter :search, with_example: true

    let!(:organization) { create(:organization) }
    let!(:id) { organization.id }

    let(:members) { create_list(:user, 3) }

    before do
      organization.users << members
    end

    context 'as admin' do
      let(:headers) { auth_headers(admin) }

      it 'Get organization members' do
        explanation 'All organization members'
        do_request

        expect(response_status).to eq 200
        expect(json.size).to eq 3
      end
    end

    let(:raw_post) { params.to_json }
  end
end
