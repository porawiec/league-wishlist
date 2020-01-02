class Wish < ApplicationRecord
    belongs_to :player
    belongs_to :champ
    has_many :skins, through: :champs

    validates :rank, numericality: { only_integer: true }
end