class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  validates :name, uniqueness: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
end
