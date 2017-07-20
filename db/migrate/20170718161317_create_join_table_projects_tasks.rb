class CreateJoinTableProjectsTasks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :tasks do |t|
      t.index [:project_id, :task_id]
      t.index [:task_id, :project_id]
    end
  end
end
