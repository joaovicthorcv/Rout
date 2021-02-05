class Category < ApplicationRecord
    has_many :activities, dependent: :destroy
    belongs_to :user
end
