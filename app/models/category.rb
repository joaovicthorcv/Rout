class Category < ApplicationRecord
    has_many :activities
    belongs_to :user
end
