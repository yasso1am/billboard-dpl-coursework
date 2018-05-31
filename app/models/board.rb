class Board < ApplicationRecord
  validates :name, presence: true
  has_many :artists, dependent: :nullify
  has_many :songs, dependent: :nullify
end
