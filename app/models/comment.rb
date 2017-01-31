class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :device
end
