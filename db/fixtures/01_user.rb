User.seed(:id, [
  { id: 1, email: 'user1@example.com', password: 'user1user1', name: 'Kana Karimata', userid: 'kana1022', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user1.jpg"), filename: File.basename("./db/fixtures/images/user1.jpg")) },
  { id: 2, email: 'user2@example.com', password: 'user2user2', name: 'Rena Takeda', userid: 'rena3110', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user2.jpg"), filename: File.basename("./db/fixtures/images/user2.jpg")) },
  { id: 3, email: 'user3@example.com', password: 'user3user3', name: 'Nao Saito', userid: 'nao0420', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user3.jpg"), filename: File.basename("./db/fixtures/images/user3.jpg")) },
  { id: 4, email: 'user4@example.com', password: 'user4user4', name: 'Ai Miura', userid: 'ai0101', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user4.jpg"), filename: File.basename("./db/fixtures/images/user4.jpg")) },
  { id: 5, email: 'user5@example.com', password: 'user5user5', name: 'Narumi Mikuni', userid: 'naru0505', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user5.jpg"), filename: File.basename("./db/fixtures/images/user5.jpg")) },
  { id: 6, email: 'user6@example.com', password: 'user6user6', name: 'Mugi Kinoshita', userid: 'mugimugi', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user6.jpg"), filename: File.basename("./db/fixtures/images/user6.jpg")) },
  { id: 7, email: 'user7@example.com', password: 'user7user7', name: 'Miku Narita', userid: 'naritarian', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user7.jpg"), filename: File.basename("./db/fixtures/images/user7.jpg")) },
  { id: 8, email: 'user8@example.com', password: 'user8user8', name: 'Naoki Takahashi', userid: 'naonao', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.new("./db/fixtures/images/user8.jpg"), filename: File.basename("./db/fixtures/images/user8.jpg")) },
])