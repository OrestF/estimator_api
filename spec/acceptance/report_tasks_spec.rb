require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Tasks' do
  let(:worker) { create(:worker) }

  post '/report_tasks' do
    with_options with_example: true do
      parameter :name, requred: true
      parameter :tech, Estimation::Const::TECHNOLOGIES, required: true
    end

    context 'as worker' do
      let(:headers) { auth_headers(worker) }

      context 'with required params' do
        context 'when task exist' do
          let!(:project) { create(:project, organization: worker.organization) }
          let!(:report) { create(:report, project: project) }
          # let!(:report_task) { create(:report_task, report_id: report.id) }
          let!(:task) { create(:task) }
          let(:params) do
            {
              report_task: {
                optimistic: Faker::Number.decimal,
                pessimistic: Faker::Number.decimal,
                report_id: report.id,
                task_id: task.id,
                name: Faker::Name.name
              }
            }
          end

          it 'Create report task' do
            expect(Task.count).to eq 1
            do_request

            expect(response_status).to eq 200
            expect(json['name']).to eq task.name
            expect(json['tech']).to eq task.tech
            expect(Task.count).to eq 1
          end
        end
      end

      context 'without required params' do
        let(:params) { { report_task: { tech: nil } } }

        it 'returns error response', document: false do
          do_request

          expect(response_status).to eq 400
          expect(json['errors']).to be_present
        end
      end
    end

    let(:raw_post) { params.to_json }
  end
end
