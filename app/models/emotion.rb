class Emotion < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :feelings

    # has_enumeration_for :feelings, with: Feelings, create_helpers: true
    # serialize :feelings_id, Array
end
