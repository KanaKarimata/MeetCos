class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.string :model_name, null: false
      t.integer :model_id, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
