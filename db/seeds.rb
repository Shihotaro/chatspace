User.create(name: 'admin', email: 'admin@email.com', password: 'admin', password_confirmation: 'admin')
User.create(name: 'sample', email: 'sample@email.com', password: 'sample', password_confirmation: 'sample')
User.create(name: 'guest_login', email: 'guest@example.com', password: 'guest_password')

Question.create(name: '匿名', title: '治療中の頭痛について', content: "はじめまして。\r\n普段から頭痛に悩んでいます。\r\n不妊治療中に飲める薬や漢方などはありますか？", user_id: 2)
Question.create(name: 'A.S', title: '眠れない時', content: "最近、いろんなことを考えていて、なかなか眠ることができません。\r\n睡眠が浅く、十分な睡眠が取れていない気がします。\r\n睡眠不足やストレスは治療にも良くないので直したいです。\r\nこんな時皆さんはどうしてますか？", user_id: 2)

Answer.create(name: '匿名', content: "頭痛つらいですよね。\r\n私も頭痛がつらいときは、XXX漢方を飲んでいます。\r\nぜひ、お医者さんにも相談してみてください。", question_id: 1)
Answer.create(name: 'CCC', content: "私は就寝前に温かい飲み物をを飲んでいます。\r\nカラダもココロも温まってリラックスできますよ。", question_id: 2)

Record.create(date: '2023-09-01', body_temperature: 35, weight: 55, body_fat_percentage: 20, condition: '良い', memo: "３色しっかり食べてお腹が苦しい。\r\n明日は絶対運動するぞ!", user_id: 2)
Record.create(date: '2023-09-02', body_temperature: 36, weight: 57, body_fat_percentage: 21, condition: '良い', memo: '今日は運動をした！', user_id: 2)
Record.create(date: '2023-09-03', body_temperature: 35, weight: 50, body_fat_percentage: 19, condition: '良い', memo: "今日は筋トレをした!\r\n明日も運動するぞ!", user_id: 2)
Record.create(date: '2023-09-04', body_temperature: 38, weight: 49, body_fat_percentage: 16, condition: '悪い', memo: '少し熱っぽくダルい、、。', user_id: 2)
Record.create(date: '2023-09-05', body_temperature: 39, weight: 45, body_fat_percentage: 12, condition: '悪い', memo: '風を引いた', user_id: 2)
