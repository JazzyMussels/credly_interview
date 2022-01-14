class Badge < ApplicationRecord
    has_many :character_badges
    has_many :characters, through: :character_badges

end
