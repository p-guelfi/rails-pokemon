class Pokemon < ApplicationRecord
  has_many :pokeballs
  validates :name, presence: true
  has_one_attached :photo
end
