class Board < ApplicationRecord
  has_many :artists, dependent: :nullify
  has_many :songs, dependent: :nullify
end
