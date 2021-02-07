class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :task
  belongs_to :child_task, class_name: 'Task'
end
