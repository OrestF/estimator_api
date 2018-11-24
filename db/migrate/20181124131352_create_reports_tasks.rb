class CreateReportsTasks < ActiveRecord::Migration[5.2]
  def up
    create_join_table :reports, :tasks
  end
end
