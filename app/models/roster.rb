class Roster < ApplicationRecord
    belongs_to :player
    belongs_to :champ
    has_many :skins, through: :champs
end