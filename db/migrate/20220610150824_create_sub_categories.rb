class CreateSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_categories do |t|
      t.string :sub_category
      t.integer :main_category_id

      t.timestamps
    end
  end
end
