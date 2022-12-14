# frozen_string_literal: true

20.times { Author.create({ name: Faker::Name.name }) }
20.times do
  Article.create({ title: Faker::Book.title, body: Faker::Lorem.sentence, author_id: rand(21),
                   status: rand(2) })
end
80.times do
  Comment.create({ body: Faker::Lorem.sentence, status: rand(2), author_id: rand(21),
                   article_id: rand(21) })
end
20.times { Tag.create({ title: Faker::Hacker.adjective }) }
40.times { ArticleTag.create({ article_id: rand(21), tag_id: rand(21) }) }
#40.times { Like.create({ author_id: rand(21), likeable_id: rand(21) }) }
