class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :tech
      t.references :user

      t.timestamps
    end
  end
end
