class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :priority
  
  
  
  validates :category, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :status, presence: true
  validates :priority, presence: true
  validates :start, presence: true
  validates :deadline, presence: true
  
  # validate :deadline_after_today
  # validate :start_after_deadline
  
  
  
  # def deadline_after_today
  #   # 今日より昔に締め切り日が設定されていた場合はエラー
  #   errors.add(:deadline, 'は、今日以降に設定してください。') if deadline > Date.today
  # end
  
  # def start_after_deadline
  #   # 開始日が締切日の後に設定されていた場合はエラー
  #   errors.add(:start, 'は、締切日より前に設定してください。') if start > deadline
  # end
end
