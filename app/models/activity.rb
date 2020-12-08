class Activity < ApplicationRecord
    belongs_to :user
    belongs_to :category
    
    validates :category, :name, :start_time, presence: true
    
    def day
        self.created_at.strftime("%e, %B, %Y")
    end
end
