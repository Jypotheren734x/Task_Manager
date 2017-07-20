class Project < ApplicationRecord
  has_many :project_tasks
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks, through: :project_tasks
  has_many :completed_tasks, -> {where(tasks: {completed: true})}, through: :project_tasks, source: :task
  belongs_to :group

  def progress
    ((completed_tasks.count.to_f/tasks.count.to_f)*100)
  end
end
