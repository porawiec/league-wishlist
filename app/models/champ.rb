class Champ < ApplicationRecord
    has_many :wishes
    has_many :rosters
    has_many :skins
end