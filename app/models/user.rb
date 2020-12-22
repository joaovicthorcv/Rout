class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :add_base_categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :activities
         has_many :categories
  private
    def add_base_categories
      self.categories.create(title: "thought", user_id: self.id)
      self.categories.create(title: "action", user_id: self.id)
      self.categories.create(title: "habit", user_id: self.id)  
    end
end
