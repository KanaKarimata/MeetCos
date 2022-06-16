class CreateMainCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :main_categories do |t|
      t.string :main_category

      t.timestamps
    end
  end
end
