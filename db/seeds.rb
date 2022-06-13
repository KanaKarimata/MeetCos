# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# main_categories = [
#   "スキンケア",
#   "フェイス",
#   "ポイントメイク",
#   "ボディ",
#   "フレグランス",
#   "美容機器",
#   "美容医療",
#   "その他"
# ]

# sub_categories =[
#   {sub_category:"洗顔フォーム",main_category:main_categories[0]},
#   {sub_category:"クレンジング",main_category:main_categories[0]},
#   {sub_category:"日焼け止め（顔用）",main_category:main_categories[0]},
#   {sub_category:"ローション（化粧水）",main_category:main_categories[0]},
#   {sub_category:"乳液",main_category:main_categories[0]},
#   {sub_category:"セラム（美容液）",main_category:main_categories[0]},
#   {sub_category:"保湿クリーム",main_category:main_categories[0]},
#   {sub_category:"その他",main_category:main_categories[0]},
#   {sub_category:"ファンデーション",main_category:main_categories[1]},
#   {sub_category:"コンシーラー",main_category:main_categories[1]},
#   {sub_category:"フェイスパウダー",main_category:main_categories[1]},
#   {sub_category:"ハイライト・シェーディング",main_category:main_categories[1]},
#   {sub_category:"化粧下地",main_category:main_categories[1]},
#   {sub_category:"その他",main_category:main_categories[1]},
#   {sub_category:"アイシャドウ",main_category:main_categories[2]},
#   {sub_category:"アイライナー",main_category:main_categories[2]},
#   {sub_category:"アイベース",main_category:main_categories[2]},
#   {sub_category:"マスカラ",main_category:main_categories[2]},
#   {sub_category:"アイブロウ",main_category:main_categories[2]},
#   {sub_category:"マスカラ",main_category:main_categories[2]},
#   {sub_category:"リップ",main_category:main_categories[2]},
#   {sub_category:"チーク",main_category:main_categories[2]},
#   {sub_category:"カラコン",main_category:main_categories[2]},
#   {sub_category:"その他",main_category:main_categories[2]},
#   {sub_category:"ボディークリーム",main_category:main_categories[3]},
#   {sub_category:"日焼け止め（体用）",main_category:main_categories[3]},
#   {sub_category:"シャンプー・コンディショナー",main_category:main_categories[3]},
#   {sub_category:"除毛クリーム",main_category:main_categories[3]},
#   {sub_category:"ボディミスト",main_category:main_categories[4]},
#   {sub_category:"香水",main_category:main_categories[4]},
#   {sub_category:"柔軟剤",main_category:main_categories[4]},
#   {sub_category:"その他",main_category:main_categories[4]},
#   {sub_category:"美顔器",main_category:main_categories[5]},
#   {sub_category:"保湿スチーマー",main_category:main_categories[5]},
#   {sub_category:"その他",main_category:main_categories[5]},
#   {sub_category:"脱毛",main_category:main_categories[6]},
#   {sub_category:"美容ハイフ",main_category:main_categories[6]},
#   {sub_category:"整形",main_category:main_categories[6]},
#   {sub_category:"ホワイトニング",main_category:main_categories[6]},
#   {sub_category:"シワ・たるみ改善・シミ取り・肌質改善",main_category:main_categories[6]},
#   {sub_category:"その他",main_category:main_categories[6]},
#   {sub_category:"その他",main_category:main_categories[7]},
# ]

# main_categories.each do |main_category|
#   MainCategory.find_or_create_by!(main_category: main_category)
# end

# sub_categories.each do |sub_category|
#   main_category_id = MainCategory.find_by(main_category: sub_category[:main_category]).id
#   SubCategory.find_or_create_by!(sub_category: sub_category[:sub_category], main_category_id: main_category_id)
# end