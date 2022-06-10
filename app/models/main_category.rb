class MainCategory < ApplicationRecord
  include ActiveHash::Associations
  has_many :sub_categories

  self.data = [
    {id: 1, main_category: "スキンケア" },
    {id: 2, main_category: "フェイス" },
    {id: 3, main_category: "ポイントメイク" },
    {id: 4, main_category: "ボディ" },
    {id: 5, main_category: "フレグランス" },
    {id: 6, main_category: "美容機器" },
    {id: 7, main_category: "美容医療" },
    {id: 8, main_category: "その他" },
  ]
end
