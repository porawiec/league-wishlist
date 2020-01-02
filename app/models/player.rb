class Player < ApplicationRecord
    has_many :wishes
    has_many :rosters
    has_many :desired_champs, through: :wishes, source: :champ
    has_many :owned_champs, through: :rosters, source: :champ
    has_many :desired_skins, through: :desired_champs, source: :skins
    has_many :owned_skins, through: :owned_champs, source: :skins

    has_secure_password

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true

    # def password=(new_password)
    #     self.password_digest = BCrypt::Password.create(new_password)
    # end

    # def password
    #     BCrypt::Password.new(self.password_digest)
    # end

    # def authenticate(attempt)
    #     return self.password == attempt
    # end
end