User.create(name: 'sample', email: 'sample@email.com', password: 'sample', password_confirmation: 'sample')

Question.create(name: '匿名', title: '治療中の頭痛について', content: "はじめまして。\r\n普段から頭痛に悩んでいます。\r\n不妊治療中に飲める薬や漢方などはありますか？")
Question.create(name: 'A.S', title: '眠れない時', content: "最近、いろんなことを考えていて、なかなか眠ることができません。\r\n睡眠が浅く、十分な睡眠が取れていない気がします。\r\n睡眠不足やストレスは治療にも良くないので直したいです。\r\nこんな時皆さんはどうしてますか？")

Record.create(date: '2023-09-01', body_temperature: 35, weight: 55, body_fat_percentage: 20, condition: '良い', memo: "３色しっかり食べてお腹が苦しい。\r\n明日は絶対運動するぞ!", user_id: 1)
Record.create(date: '2023-09-02', body_temperature: 36, weight: 57, body_fat_percentage: 21, condition: '良い', memo: '今日は運動をした！', user_id: 1)
Record.create(date: '2023-09-03', body_temperature: 35, weight: 50, body_fat_percentage: 19, condition: '良い', memo: "今日は筋トレをした!\r\n明日も運動するぞ!", user_id: 1)
Record.create(date: '2023-09-04', body_temperature: 38, weight: 49, body_fat_percentage: 16, condition: '悪い', memo: '少し熱っぽくダルい、、。', user_id: 1)
Record.create(date: '2023-09-05', body_temperature: 39, weight: 45, body_fat_percentage: 12, condition: '悪い', memo: '風を引いた', user_id: 1)
