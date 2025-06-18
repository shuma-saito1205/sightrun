class Activity < ApplicationRecord
  belongs_to :user

  validates :mileage, presence: true
  validates :hour, presence: true
  
end
