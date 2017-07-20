class Project < ApplicationRecord
  has_many :project_tasks
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks, through: :project_tasks
  has_many :completed_tasks, -> {where(tasks: {completed: true})}, through: :project_tasks, source: :task
  belongs_to :group
  before_destroy :destroy_user_projects

  def progress
    ((completed_tasks.count.to_f/tasks.count.to_f)*100)
  end

  def destroy_user_projects
    self.user_projects.delete_all
    self.tasks.delete_all
  end
end
