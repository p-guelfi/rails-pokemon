class Pokeball < ApplicationRecord
  belongs_to :pokemon
  belongs_to :trainer
  validates :caught_on, presence: true
end
