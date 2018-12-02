class ChangeMarksToReportTasks < ActiveRecord::Migration[5.2]
  def up
    rename_table :marks, :report_tasks
    add_column :report_tasks, :description, :text
    add_reference :report_tasks, :report, index: true
    remove_reference :report_tasks, :user

    drop_table :reports_tasks
  end

  def down
    create_table "reports_tasks", id: false, force: :cascade do |t|
      t.bigint "report_id", null: false
      t.bigint "task_id", null: false
    end
    remove_reference :report_tasks, :report
    add_reference :report_tasks, :user
    remove_column :report_tasks, :description

    rename_table :report_tasks, :marks
  end
end
