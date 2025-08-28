class Event < ApplicationRecord
  belongs_to :admin

  validates :title, presence: true
  validates :detail, presence: true
  validates :location, presence: true, length: { in: 1..100 }
  validates :start, presence: true
  validates :end, presence: true
end
