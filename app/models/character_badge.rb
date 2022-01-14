class CharacterBadge < ApplicationRecord
    belongs_to :character
    belongs_to :badge
end
