class CreateVenders < ActiveRecord::Migration[6.0]
  def change
    create_table :venders do |t|
      t.string :title, null: false
      t.integer :genre_id, null: false
      t.text :introduction
      t.text :residence, null: false

      t.timestamps
    end
  end
end
