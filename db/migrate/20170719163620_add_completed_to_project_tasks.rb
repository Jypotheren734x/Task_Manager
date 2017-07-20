class AddCompletedToProjectTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :project_tasks, :completed, :boolean, defaul: false
  end
end
