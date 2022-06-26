Post.seed(:id, [
  { id: 1, user_id: 1, caption: '', post_images: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user1.jpg"), filename: File.basename("./db/fixtures/images/user1.jpg")) },
  ])