# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'sample', email: 'sample@email.com', password: 'sample', password_confirmation: 'sample')

Question.create(name: '匿名', title: '治療中の頭痛について', content: "はじめまして。\r\n普段から頭痛に悩んでいます。\r\n不妊治療中に飲める薬や漢方などはありますか？")
Question.create(name: 'A.S', title: '眠れない時', content: "最近、いろんなことを考えていて、なかなか眠ることができません。\r\n睡眠が浅く、十分な睡眠が取れていない気がします。\r\n睡眠不足やストレスは治療にも良くないので直したいです。\r\nこんな時皆さんはどうしてますか？")
