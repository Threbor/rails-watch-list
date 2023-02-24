class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :photo
  # A list must have a unique name.
  validates :name, presence: true, uniqueness: true
end
