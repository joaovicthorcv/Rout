class Activity < ApplicationRecord
    belongs_to :user
    belongs_to :category
    
    validates :start_time, presence: true
    
    def day
        self.created_at.strftime("%e, %B, %Y")
    end
end
