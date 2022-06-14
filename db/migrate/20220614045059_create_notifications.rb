class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :receiver_id
      t.integer :sender_id
      t.integer :post_id, null: true
      t.integer :post_comment_id, null: true
      t.integer :message_id, null: true
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
