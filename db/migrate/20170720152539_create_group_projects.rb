class CreateGroupProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :group_projects do |t|
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
