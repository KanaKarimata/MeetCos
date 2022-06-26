Post.seed(:id, [
  { id: 1,
    user_id: 1,
    caption: '＆beのアイシャドウゲットしました！！粉質が柔らかいのでブレンディングもしやすくて、グラデーションが簡単にできるし、何より色味が本当におしゃれ！',
    post_images: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/andbe1.jpg"), filename: File.basename("./db/fixtures/images/andbe1.jpg")),
    post_images: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/andbe2.jpg"), filename: File.basename("./db/fixtures/images/andbe2.jpg"))
  },

  { id: 2,
    user_id: 1,
    caption: 'あかりんプロデュースのB IDOLのアイシャドウ！！すごく発色が良くて、色持ちがいい！キラキラのラメがすごく綺麗に光ってくれる！可愛い〜❤︎',
    post_images: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/andbe1.jpg"), filename: File.basename("./db/fixtures/images/andbe1.jpg")),
    post_images: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/andbe2.jpg"), filename: File.basename("./db/fixtures/images/andbe2.jpg"))
  },



  ])