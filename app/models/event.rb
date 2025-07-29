class Event < ApplicationRecord
  belongs_to :admin

  validates :title, presence: true
  validates :detail, presence: true
  validates :location, presence: true
  validates :start, presence: true
  validates :end, presence: true
end
