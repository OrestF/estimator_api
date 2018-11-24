class CreateOrganizationsUsers < ActiveRecord::Migration[5.2]
  def up
    create_join_table :organizations, :users
  end
end
