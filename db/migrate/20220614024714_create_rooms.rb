class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.references :guest, null: false, foreign_key: { to_table: :users }

      t.timestamps
      t.index [:host_id, :guest_id], unique: true
    end
  end
end
