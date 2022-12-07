20.times { Author.create({ name: Faker::Name.name }) }
20.times { Article.create({ title: Faker::Book.title, body: Faker::Lorem.sentence, author_id: rand(20), status: rand(2) }) }
20.times { Comment.create({ body: Faker::Lorem.sentence, status: rand(2), author_id: rand(20), article_id: rand(20) }) }
20.times { Tag.create({ title: Faker::Hacker.adjective }) }
