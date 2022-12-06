#5.times { Author.create({ name: Faker::Name.name }) }
5.times { Article.create({ title: Faker::Book.title, body: Faker::Lorem.sentence }) }
Comment.create({ body: 'first comment for first article', status: 1, author_id: 1, article_id: 1 })
Comment.create({ body: 'second comment for second article', status: 0, author_id: 2, article_id: 2 })
Comment.create({ body: 'third comment for third article', status: 1, author_id: 3, article_id: 3 })
Comment.create({ body: 'fourth comment second comment for third article', status: 0, author_id: 2, article_id: 3 })
Comment.create({ body: 'fifth comment for fourth article', status: 1, author_id: 2, article_id: 4 })
#10.times { Tag.create({ title: Faker::Hacker.adjective }) }
