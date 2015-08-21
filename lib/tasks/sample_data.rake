desc "Fill database with sample data"
  task populate: :environment do
    users = User.all(limit: 6)
    50.times do
      title = Faker::Lorem.sentence(5)
      content = Faker::Lorem.sentence(5)
      homerooms.each { |homeroom| homeroom.posts.create!(title: title, content: content) }
    end
  end
