class Category < ApplicationRecord
  belongs_to :user
  has_many :task
  
  validates :category, length: { maximum: 255 }
end
