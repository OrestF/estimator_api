class AddOrganizationToUsers < ActiveRecord::Migration[5.2]
  def up
    add_reference :users, :organization, foreign_key: true
    drop_table :organizations_users
  end

  def down
    remove_reference :users, :organization
    create_join_table :organizations, :users
  end
end
