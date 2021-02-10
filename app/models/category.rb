class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  
  validates :category, presence: true, length: { maximum: 255 },
                       uniqueness: { scope: :user_id, case_sensitive: false }
end
