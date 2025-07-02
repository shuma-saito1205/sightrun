class FavoriteCourse < ApplicationRecord
  belongs_to :user
  has_many :roots, dependent: :destroy
end
