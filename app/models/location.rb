class Location < ApplicationRecord
  has_many :devices
  belongs_to :company
end
