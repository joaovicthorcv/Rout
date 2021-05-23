class Activity < ApplicationRecord
    belongs_to :user
    belongs_to :category
    
    validates :user_id, :category_id, :start_time, :name, :mastery, :pleasure, presence: true
    
    def day
        self.created_at.strftime("%e, %B, %Y")
    end
end
