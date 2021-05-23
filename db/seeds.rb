# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# feelings = Feeling.create!([
#     { name: 'anxious' },
#     { name: 'joyful' },
#     { name: 'loving' },
#     { name: 'happy' },
#     { name: 'optimistic' },
#     { name: 'calm' },
#     { name: 'light' },
#     { name: 'special' },
#     { name: 'proud' },
#     { name: 'excited' },
#     { name: 'embarrassed' },
#     { name: 'fearful' },
#     { name: 'ashamed' },
#     { name: 'indifferent' },
#     { name: 'insecure' },
#     { name: 'annoyed' },
#     { name: 'scared' },
#     { name: 'frustrated' },
#     { name: 'sad' },
#     { name: 'anger' },
#     { name: 'depressed' },
#     { name: 'irritated' },
#     { name: 'hurt' },
#     { name: 'guilty' },
#     { name: 'humiliated' }
# ])

50.times do 
    Activity.create({
        user_id: User.all.pluck(:id).sample,
        category_id: Category.all.pluck(:id).sample,
        start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
        name: Activity.all.pluck(:name).sample,
        mastery: Faker::Number.between(from: 1, to: 10),
        pleasure: Faker::Number.between(from: 1, to: 10)
    })
end 