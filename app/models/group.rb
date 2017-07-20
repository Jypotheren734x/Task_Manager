class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :projects
end
