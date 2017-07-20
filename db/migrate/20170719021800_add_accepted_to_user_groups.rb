class AddAcceptedToUserGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :user_groups, :accepted, :boolean
  end
end
