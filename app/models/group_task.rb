class GroupTask < ApplicationRecord
  belongs_to :task
  belongs_to :group
end
