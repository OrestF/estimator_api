require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Projects' do
  let(:manager) { create(:manager) }

  get '/organization/projects' do
    let!(:projects) { create_list(:project, 3, organization: manager.organization) }
    let!(:project) { create(:project) }

    context 'as organization member' do
      let(:headers) { auth_headers(manager) }

      it 'Get projects list' do
        do_request

        expect(response_status).to eq 200
        expect(json.size).to eq 3
      end
    end
  end

  get '/organization/projects/:id' do
    let!(:project) { create(:project, organization: manager.organization) }
    let!(:id) { project.id }

    context 'as organization member' do
      let(:headers) { auth_headers(manager) }

      before do
        project.estimators << FactoryBot.create_list(:user, 2)
      end

      it 'Get project' do
        do_request

        expect(response_status).to eq 200
        expect(json['name']).to eq project.name
        expect(json).to have_key('estimators')
      end
    end
  end

  post '/organization/projects' do
    with_options with_example: true do
      parameter :name, required: true
      parameter :description, required: false
    end

    context 'as manager' do
      let(:headers) { auth_headers(manager) }

      context 'with required params' do
        let(:params) { { name: Faker::Company.name, description: Faker::Lorem.sentence } }

        it 'Create project' do
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

  put '/organization/projects/:id' do
    with_options with_example: true do
      parameter :name, required: false
      parameter :description, required: false
      parameter :brief_description, required: false
    end

    let!(:id) { create(:project, organization: manager.organization).id }

    context 'as admin' do
      let(:headers) { auth_headers(manager) }

      context 'with required params' do
        let(:params) { { name: Faker::Company.name } }

        it 'Update project' do
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

  delete '/organization/projects/:id' do
    let!(:project) { create(:project, organization: manager.organization) }
    let!(:id) { project.id }

    context 'as manager' do
      let(:headers) { auth_headers(manager) }

      it 'Destroy project' do
        do_request

        expect(response_status).to eq 200
        expect(json['id']).to eq project.id
        expect(Project.find_by(id: json['id'])).to eq nil
      end
    end

    let(:raw_post) { params.to_json }
  end
end
