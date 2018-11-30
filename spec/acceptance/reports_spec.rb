require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Reports' do
  let(:manager) { create(:manager) }

  get '/reports/:id' do
    context 'as worker who creates report' do
      let(:worker) { create(:worker) }
      let!(:project) { create(:project, organization: worker.organization) }
      let!(:report) { create(:report, project: project, user_id: worker.id) }
      let(:id) { report.id }
      let(:headers) { auth_headers(worker) }

      it 'Get report' do
        do_request

        expect(response_status).to eq 200
        expect(json['tech']).to eq report.tech
      end
    end

    context 'as another worker', document: false do
      let(:creator) { create(:worker) }
      let(:worker) { create(:worker) }
      let!(:project) { create(:project, organization: worker.organization) }
      let!(:report) { create(:report, project: project, user_id: creator.id) }
      let(:id) { report.id }
      let(:headers) { auth_headers(worker) }

      it 'Get report' do
        do_request

        expect(response_status).to eq 403
        expect(json).to have_key('errors')
      end
    end
  end

  post '/reports' do
    with_options with_example: true do
      parameter :tech, Estimation::Const::TECHNOLOGIES, required: true
      parameter :project_id, 'integer', required: true
    end

    context 'as manager' do
      let(:headers) { auth_headers(manager) }

      context 'with required params' do
        let!(:project) { create(:project, organization: manager.organization) }
        let(:params) { { report: { tech: Estimation::Const::TECHNOLOGIES.sample, project_id: project.id } } }

        it 'Create report' do
          do_request

          expect(response_status).to eq 200
          expect(json['tech']).to eq params[:report][:tech]
          expect(json['status']).to eq Report.statuses.keys.first
        end
      end

      context 'without required params' do
        let(:params) { { report: { tech: nil } } }

        it 'returns error response', document: false do
          do_request

          expect(response_status).to eq 400
          expect(json['errors']).to be_present
        end
      end
    end

    let(:raw_post) { params.to_json }
  end

  delete '/reports/:id' do
    let!(:report) { create(:report, project: create(:project, organization: manager.organization)) }
    let!(:id) { report.id }

    context 'as manager' do
      let(:headers) { auth_headers(manager) }

      it 'Destroy report' do
        do_request

        expect(response_status).to eq 200
        expect(json['id']).to eq report.id
        expect(Report.find_by(id: json['id'])).to eq nil
      end
    end

    let(:raw_post) { params.to_json }
  end
end
