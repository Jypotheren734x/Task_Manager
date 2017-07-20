class AddCompletedToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :completed, :boolean
    remove_column :project_tasks, :completed
  end
end
