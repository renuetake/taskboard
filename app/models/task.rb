class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :priority
  
  # 親子関係テーブルの関係定義
  has_many :relationships
  has_many :children, through: :relationships, source: :child_task
  has_many :reverses_of_relationships, class_name: 'Relationship', foreign_key: 'child_task_id'
  has_many :parents, through: :reverses_of_relationships, source: :task # 複数形だが、親は一つだけ
  
  
  
  validates :category, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :status, presence: true
  validates :priority, presence: true
  validates :start, presence: true
  validates :deadline, presence: true
  
  validate :deadline_after_today
  validate :start_after_deadline
  
  
  
  def deadline_after_today
    # 今日より昔に締め切り日が設定されていた場合はエラー
    unless deadline == nil
      errors.add(:deadline, '締切日は今日以降に設定してください。') if deadline.to_date < Date.today
    end
  end
  
  def start_after_deadline
    if not (deadline == nil or start == nil)
      # 開始日が締切日の後に設定されていた場合はエラー
      errors.add(:start, '開始日は、締切日より前に設定してください。') if start.to_date > deadline.to_date
    end
  end
  
  
  def set_child(child_task)
    if self != child_task and 
      self.parents.count == 0 and 
      child_task.parents.count == 0 and
      child_task.children.count == 0
      # 子に設定するタスクは自分自身ではない、かつ、
      # 自分の親が存在しない(孫タスクは許可しないため)、かつ、
      # 子に設定するタスクが誰かの子ではない場合(付け替え処理がめんどくさいため、許さない)、かつ、
      # 子に設定するタスクが子を持っていない場合(孫タスクは許可しないため)
      self.relationships.find_or_create_by(user_id: self.user.id, child_task_id: child_task.id)
    end
  end
  
  def unset_child(child_task)
    relationship = self.relationships.find_by(child_task_id: child_task.id)
    relationship.destroy if relationship
  end
  
end
