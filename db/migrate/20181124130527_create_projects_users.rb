class CreateProjectsUsers < ActiveRecord::Migration[5.2]
  def up
    create_join_table :projects, :users
  end
end
