User.seed(:id, [
  { id: 1, email: 'test1@test1', password: 'test1test1', name: 'test1', userid: 'test1', is_deleted: false, profile_image: ActiveStorage::Brob.create_and_upload!(io: File.open("./db/fixtures/image.jpg")) },
  { id: 2, email: 'test2@test2', password: 'test2test2', name: 'test2', userid: 'test2', is_deleted: false },
  { id: 2, email: 'test2@test2', password: 'test2test2', name: 'test2', userid: 'test2', is_deleted: false },
])