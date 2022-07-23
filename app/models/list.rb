class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks
  has_and_belongs_to_many :movies
end
