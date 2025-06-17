class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :permits, dependent: :destroy
  has_many :users, through: :group_users

  validates :name, presence: true
  validates :theme, presence: true
end
