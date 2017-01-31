class Comment < ApplicationRecord
  validates :body, presence: true
  validates :user, presence: true
  validates :status, presence: true
  
  belongs_to :user
  belongs_to :status
  belongs_to :device
end
