class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :user_groups
  has_many :owned_groups, class_name: "Group", foreign_key: "owner_id"
  has_many :recieved_group_invites, class_name: "UserGroup", foreign_key: "group_id"

  has_many :active_groups, -> {where(user_groups: {accepted: true})}, through: :user_groups, source: :group
  has_many :received_groups, -> {where(user_groups: {accepted: true})}, through: :recieved_group_invites, source: :user
  has_many :pending_groups, -> {where(user_groups: {accepted: false})}, through: :user_groups, source: :group
  has_many :requested_groups, -> {where(user_groups: {accepted: false})}, through: :recieved_group_invites, source: :user


  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends, -> {where(friendships: {accepted: true})}, through: :friendships, source: :friend
  has_many :received_friends, -> {where(friendships: {accepted: true})}, through: :received_friendships, source: :user
  has_many :pending_friends, -> {where(friendships: {accepted: false})}, through: :friendships, source: :friend
  has_many :requested_friends, -> {where(friendships: {accepted: false})}, through: :received_friendships, source: :user

  def full_name
    first_name + ' ' + last_name
  end

  def is_owner?(group)
    owned_groups.include?(group)
  end

  def friends
    active_friends | received_friends
  end

  def friends_pending
    pending_friends | requested_friends
  end

  def friends_with?(user)
    friends.include?(user)
  end

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

  def groups
    active_groups | received_groups
  end

  def groups_pending
    pending_groups | requested_groups
  end

  def in_group?(group)
    groups.include?(group)
  end

  def remove_group(group)
    current_user.groups.destroy(group)
  end

end
