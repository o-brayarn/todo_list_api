puts "🌱 Seeding data..."

# place your seeds here
Category.create(name: "Chores")
Category.create(name: "Code challenge")
Category.create(name: "code wars")
Category.create(name: "Hike")
Category.create(name: "watch documentaries")

Category.all.each do |category|
    6.times do
        TodoList.create(
            title: Faker::Lorem.sentence(word_count: 5),
            description:Faker::Lorem.sentence(word_count: 20),
            category_id:category.id,
            status: false
        )
    end
end
puts "🌱 Done seeding!"
