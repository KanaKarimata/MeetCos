class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.integer :post_category
      t.integer :color_type
      t.integer :makeup_image
      t.integer :main_category_id
      t.integer :sub_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
