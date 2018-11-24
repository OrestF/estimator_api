class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :brief_description
      t.references :organization

      t.timestamps
    end
  end
end
