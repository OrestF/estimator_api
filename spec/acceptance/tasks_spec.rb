require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Tasks' do
  get '/tasks/search' do
    with_options with_example: true do
      parameter :name, 'Paypal integration', required: true
      parameter :tech, Estimation::Const::TECHNOLOGIES, required: true
    end

    context 'as worker' do
      let(:worker) { create(:worker) }
      let!(:report_tasks) { create_list(:report_task, 10) }
      let(:name1) { 'Super unique name one' }
      let(:name2) { 'Super unique name two' }
      let(:name3) { 'Super unique name three' }
      let!(:report_task1) { create(:report_task, task: create(:task, name: name1, tech: 'ruby')) }
      let!(:report_task2) { create(:report_task, task: create(:task, name: name2, tech: 'ruby')) }
      let!(:report_task3) { create(:report_task, task: create(:task, name: name3, tech: 'react')) }
      let(:headers) { auth_headers(worker) }
      let(:params) { { query: 'er uniq', tech: 'ruby' } }

      before do
        Task.reindex
      end

      it 'Search tasks' do
        do_request

        expect(response_status).to eq 200
        expect(json.map { |t| t['name'] }).to match_array([name1, name2])
      end
    end
  end

  get '/tasks/:id' do
    context 'as worker' do
      let(:worker) { create(:worker) }
      let!(:task) { create(:task) }
      let!(:report_tasks) { create_list(:report_task, 3, task: task) }
      let(:headers) { auth_headers(worker) }
      let(:id) { task.id }

      it 'Get task' do
        do_request

        expect(response_status).to eq 200
        expect(json).to have_key('average_marks')
        expect(json['average_marks'].keys).to match_array(%w[optimistic pessimistic])
      end
    end
  end
end
