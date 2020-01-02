class Champ < ApplicationRecord
    has_many :wish
    has_many :roster
    has_many :skins
end