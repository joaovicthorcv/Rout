class User < ApplicationRecord
  after_create :set_basic_categories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, allow_blank: false

         has_many :activities
         has_many :emotions
         has_many :categories
         has_many :feelings
         
        def generate_jwt
          JWT.encode({ id: id,
                      exp: 60.days.from_now.to_i },
                     Rails.application.secrets.secret_key_base)
        end

        def set_basic_categories
          self.categories = Category.create!([
              { title: "Sono", color: "#003487", user_id: self.id},
              { title: "Refeição", color: "#ff8438", user_id: self.id},
              { title: "Exercício físico", color: "#1ce823", user_id: self.id},
              { title: "Lazer", color: "#00e0e0", user_id: self.id},
              { title: "Hobbie", color: "#ac00e0", user_id: self.id},
              { title: "Estudo", color: "#edeb77", user_id: self.id},
              { title: "Trabalho remunerado", color: "#0073ff", user_id: self.id},
              { title: "Trabalho não-remunerado", color: "#82a9ad", user_id: self.id},
              { title: "Rotina", color: "#e6c853", user_id: self.id}
          ])
        end
     
end
