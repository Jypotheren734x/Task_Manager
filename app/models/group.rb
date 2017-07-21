class Group < ApplicationRecord
  has_many :user_groups
  has_many :users,-> {where(user_groups: {accepted: true})}, through: :user_groups, source: :user
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :projects
end
