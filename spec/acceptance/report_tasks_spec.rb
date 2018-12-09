require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Report tasks' do
  let(:worker) { create(:worker) }

  post '/report_tasks' do
    with_options with_example: true do
      parameter :report_task do
        parameter :name, 'string', required: true
        parameter :tech, Estimation::Const::TECHNOLOGIES, required: true
        parameter :optimistic, 'float', required: true
        parameter :pessimistic, 'float', required: true
        parameter :report_id, 'integer', required: true
        parameter :task_id, 'integer', required: false
        parameter :description, 'string', required: false
      end
    end

    context 'as worker' do
      let(:headers) { auth_headers(worker) }

      context 'with required params' do
        context 'when task exist' do
          let!(:project) { create(:project, organization: worker.organization) }
          let!(:report) { create(:report, project: project, user_id: worker.id) }
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
            expect(ReportTask.count).to eq 0
            do_request

            expect(response_status).to eq 200
            expect(json['name']).to eq task.name
            expect(json['tech']).to eq task.tech
            expect(Task.count).to eq 1
            expect(ReportTask.count).to eq 1
          end
        end

        context 'when task does not exist' do
          let!(:project) { create(:project, organization: worker.organization) }
          let!(:report) { create(:report, project: project, user_id: worker.id) }
          let(:params) do
            {
              report_task: {
                optimistic: Faker::Number.decimal,
                pessimistic: Faker::Number.decimal,
                report_id: report.id,
                name: Faker::Name.name
              }
            }
          end

          it 'Create report task and general task' do
            explanation('When there no appropriate task from autocomplete')

            expect(Task.count).to eq 0
            do_request
            expect(response_status).to eq 200
            expect(json['name']).to eq params.dig(:report_task, :name)
            expect(json['tech']).to eq report.tech
            expect(Task.count).to eq 1
          end
        end
      end

      context 'without required params' do
        let!(:project) { create(:project, organization: worker.organization) }
        let!(:report) { create(:report, project: project, user_id: worker.id) }
        let(:params) { { report_task: { tech: nil, report_id: report.id } } }

        it 'returns error response', document: false do
          do_request

          expect(response_status).to eq 400
          expect(json['errors']).to be_present
        end
      end
    end

    let(:raw_post) { params.to_json }
  end

  put '/report_tasks/:id' do
    with_options with_example: true do
      parameter :report_task do
        parameter :optimistic, 'float', required: false
        parameter :pessimistic, 'float', required: false
        parameter :task_id, 'integer', required: false
        parameter :description, 'string', required: false
      end
    end

    context 'as worker' do
      let(:headers) { auth_headers(worker) }

      context 'with required params' do
        let!(:project) { create(:project, organization: worker.organization) }
        let!(:report) { create(:report, project: project, user_id: worker.id) }
        let!(:task) { create(:task) }
        let!(:task2) { create(:task) }
        let!(:report_task) { create(:report_task, task_id: task.id, report_id: report.id) }
        let!(:id) { report_task.id }
        let(:params) do
          {
            report_task: {
              optimistic: Faker::Number.decimal,
              pessimistic: Faker::Number.decimal,
              task_id: task2.id,
              description: Faker::Lorem.sentence
            }
          }
        end

        it 'Update report task' do
          do_request

          expect(response_status).to eq 200
          expect(json['optimistic'].to_s).to eq params.dig(:report_task, :optimistic)
          expect(json['pessimistic'].to_s).to eq params.dig(:report_task, :pessimistic)
          expect(json['name']).to eq task2.name
          expect(json['description']).to eq params.dig(:report_task, :description)
        end
      end

      context 'without required params' do
        let!(:project) { create(:project, organization: worker.organization) }
        let!(:report) { create(:report, project: project, user_id: worker.id) }
        let!(:report_task) { create(:report_task, report_id: report.id) }
        let!(:id) { report_task.id }
        let(:params) { { report_task: { optimistic: nil } } }

        it 'returns error response', document: false do
          do_request

          expect(response_status).to eq 400
          expect(json['errors']).to be_present
        end
      end
    end

    let(:raw_post) { params.to_json }
  end

  delete '/report_tasks/:id' do
    let!(:project) { create(:project, organization: worker.organization) }
    let!(:report) { create(:report, project: project, user_id: worker.id) }
    let!(:report_task) { create(:report_task, report_id: report.id) }
    let!(:id) { report_task.id }

    context 'as worker' do
      let(:headers) { auth_headers(worker) }

      it 'Destroy report task' do
        do_request

        expect(response_status).to eq 200
        expect(json['id']).to eq report_task.id
        expect(ReportTask.find_by(id: json['id'])).to eq nil
      end
    end

    let(:raw_post) { params.to_json }
  end
end
