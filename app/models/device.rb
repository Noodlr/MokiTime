class Device < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :software
  belongs_to :location
end
