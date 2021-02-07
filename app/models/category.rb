class Category < ApplicationRecord
  belongs_to :user
  has_many :task
  
  validates :category, presence: true, length: { maximum: 255 },
                       uniqueness: { case_sensitive: false }
end
