class Artist < ApplicationRecord
  belongs_to :board, optional: true
  has_many :songs, dependent: :destroy
end
