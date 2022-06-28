Post.find_or_create_by!(id: 1) do |post|
  post.id = 1,
  post.user_id = 1,
  post.caption = '＆beのアイシャドウゲットしました！！粉質が柔らかいのでブレンディングもしやすくて、グラデーションが簡単にできるし、何より色味が本当におしゃれ！でも少し二重の線に溜りやすいのが難点かな…',
post.post_images.attach(io: File.open("./db/fixtures/images/antiaging1.jpeg"), filename: File.basename("./db/fixtures/images/antiaging1.jpeg"), content_type: 'image/jpg')
end


Post.find_or_create_by!(id: 2) do |post|
  post.id = 2,
  post.user_id = 1,
  post.caption = 'あかりんプロデュースのBE IDOLのアイシャドウを購入しました！発色がすごく良くて最初はビックリしたけど、ぼかしやすくもあるからメイクが苦手の人でも使いやすいと思う',
  post.post_images.attach(io: File.open("./db/fixtures/images/cosmetics1.jpeg"), filename: File.basename("./db/fixtures/images/cosmetics1.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.new("./db/fixtures/images/cosmetics2.jpeg"), filename: File.basename("./db/fixtures/images/cosmetics2.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by!(id: 3) do |post|
  post.id = 3,
  post.user_id = 1,
  post.caption = '衝動買いしちゃった！！可愛いいぃぃ❤︎',
  post.post_images.attach(io: File.open("./db/fixtures/images/cosmetics3.jpeg"), filename: File.basename("./db/fixtures/images/cosmetics3.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.new("./db/fixtures/images/cosmetics4.jpeg"), filename: File.basename("./db/fixtures/images/cosmetics4.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 4) do |post|
  post.id = 4,
  post.user_id = 1,
  post.caption = 'THE 良い女って感じの香り！大人っぽくて都会的で、誰からも褒められる香水だと思う！',
  post.post_images.attach(io: File.open("./db/fixtures/images/eye1.jpeg"), filename: File.basename("./db/fixtures/images/eye1.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 5) do |post|
  post.id = 5,
  post.user_id = 2,
  post.caption = 'ファーストノートはわたあめのような甘い香りで女の子って感じの香り。ミドルノートは甘さの中に柑橘系の爽快な香りを感じることができて、甘めの香りなのに夏でも爽やかに身につけられると思う！ラストノートは柑橘系の香りを強く残すかも…ワンプッシュで体全体を覆うような強めの香りだし、香りの持続力がすごいから付けるときは気をつけてね！',
  post.post_images.attach(io: File.open("./db/fixtures/images/eyeshadow1.jpeg"), filename: File.basename("./db/fixtures/images/eyeshadow1.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.open("./db/fixtures/images/eyeshadow2.jpeg"), filename: File.basename("./db/fixtures/images/eyeshadow2.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 6) do |post|
  post.id = 6,
  post.user_id = 2,
  post.caption = '導入美容液買ってみた！肌の調子が良くなってきたかも！保湿力がすごいから、導入美容液なのに朝はこれだけでスキンケア完了する笑',
  post.post_images.attach(io: File.open("./db/fixtures/images/highlight1.jpeg"), filename: File.basename("./db/fixtures/images/highlight1.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 7) do |post|
  post.id = 7,
  post.user_id = 2,
  post.caption = 'DECRTEでベース系買ってきた！元から綺麗な肌ですよ〜って感じにしてくれるんだけど、悲しいことに1日中付けてたら肌が荒れた泣
  何かはわからないけど、何かの成分が合わなかったんだろうな〜',
  post.post_images.attach(io: File.open("./db/fixtures/images/korean1.jpeg"), filename: File.basename("./db/fixtures/images/korean1.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.open("./db/fixtures/images/korean2.jpeg"), filename: File.basename("./db/fixtures/images/korean2.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 8) do |post|
  post.id = 8,
  post.user_id = 2,
  post.caption = 'Brown x Goldの組み合わせでアイシャドウ買ってきた！秋冬メイクにちょうど良さそう〜ただやっぱり二重の線にアイシャドウ溜まって汚くなっちゃうな…',
  post.post_images.attach(io: File.open("./db/fixtures/images/main-visual2.jpeg"), filename: File.basename("./db/fixtures/images/main-visual2.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.open("./db/fixtures/images/main-visual3.jpeg"), filename: File.basename("./db/fixtures/images/main-visual3.jpeg"), content_type: 'image/jpg')
  post.post_images.attach(io: File.open("./db/fixtures/images/main-visual4.jpeg"), filename: File.basename("./db/fixtures/images/main-visual4.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 9) do |post|
  post.id = 9,
  post.user_id = 3,
  post.caption = 'ファンデーションの液体の中に目に見えない美容鍼が入ってるっていうV3ファンデーション！展開色は１色のみだから、肌の色に合わない人はいるかも…（私の肌にもちょっと白すぎかも）でも見えない鍼が毛穴に入り込んで1日中美容成分を肌に注入し続けてくれるっていうから買っちゃった笑化粧品の技術すごい…',
  post.post_images.attach(io: File.open("./db/fixtures/images/makeup1.jpeg"), filename: File.basename("./db/fixtures/images/makeup1.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.open("./db/fixtures/images/makeup2.jpeg"), filename: File.basename("./db/fixtures/images/makeup2.jpeg"), content_type: 'image/jpg')
  post.post_images.attach(io: File.open("./db/fixtures/images/makeup3.jpeg"), filename: File.basename("./db/fixtures/images/makeup3.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 10) do |post|
  post.id = 10,
  post.user_id = 3,
  post.caption = 'パーソナルカラー診断受けてみたいな〜これまで自己診断でブルベ夏だと思っていたんだけど、プロのメイクさんに「イエベかな〜」って言われた',
  post.post_images.attach(io: File.open("./db/fixtures/images/man-make1.jpeg"), filename: File.basename("./db/fixtures/images/man-make1.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.open("./db/fixtures/images/man-make2.jpeg"), filename: File.basename("./db/fixtures/images/man-make2.jpeg"), content_type: 'image/jpg')
end

Post.find_or_create_by(id: 11) do |post|
  post.id = 11,
  post.user_id = 3,
  post.caption = 'TOM FORDのアイシャドウ使ってみたいなって思ってたけど1万円もするから躊躇してた。先日のプロのメイクさんが使ってくれたんだけどあまり好きな感じではなかったから、買わなくてよかったのかも！',
  post.post_images.attach(io: File.open("./db/fixtures/images/man-nail1.jpeg"), filename: File.basename("./db/fixtures/images/man-nail1.jpeg"), content_type: 'image/jpg'),
  post.post_images.attach(io: File.open("./db/fixtures/images/man-nail2.jpeg"), filename: File.basename("./db/fixtures/images/man-nail2.jpeg"), content_type: 'image/jpg')
  post.post_images.attach(io: File.open("./db/fixtures/images/man-nail3.jpeg"), filename: File.basename("./db/fixtures/images/man-nail3.jpeg"), content_type: 'image/jpg')
end