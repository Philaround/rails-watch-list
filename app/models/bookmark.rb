class Bookmark < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 6 }
  validates_uniqueness_of :movie_id, scope: [:list_id]

  belongs_to :movie
  belongs_to :list

end
