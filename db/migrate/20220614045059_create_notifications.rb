class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.string :action, null: false
      t.integer :action_id, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
