class CreateGroupTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :group_tasks do |t|
      t.references :task, foreign_key: true
      t.references :groups, foreign_key: true

      t.timestamps
    end
  end
end