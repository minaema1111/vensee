class CreateVenders < ActiveRecord::Migration[6.0]
  def change
    create_table :venders do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.integer :genre_id, null: false
      t.text :residence, null: false
      t.text :introduction
      t.timestamps
    end
  end
end
