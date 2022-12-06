# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times { Article.create({ title: Faker::Book.title, body: Faker::Lorem.sentence }) }
5.times { Author.create({ name: Faker::Name.name }) }
#Comment.create({ body: Faker::Books::CultureSeries.book, status: 1, author_id: 1, article_id: 1 })
Comment.create({ body: 'first comment for first article', status: 1, author_id: 1, article_id: 1 })
Comment.create({ body: 'second comment for second article', status: 0, author_id: 2, article_id: 2 })
Comment.create({ body: 'third comment for third article', status: 1, author_id: 3, article_id: 3 })
Comment.create({ body: 'fourth comment second comment for third article', status: 0, author_id: 2, article_id: 3 })
Comment.create({ body: 'fifth comment for fourth article', status: 1, author_id: 2, article_id: 4 })
10.times { Tag.create({ title: Faker::Hacker.adjective }) }
