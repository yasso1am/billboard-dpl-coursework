class Board < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: {presence: true, message: "your freakin' billboard dude..." }
  has_many :artists, dependent: :nullify
  has_many :songs, dependent: :nullify
    
end
