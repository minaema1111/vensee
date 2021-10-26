class CreateVenders < ActiveRecord::Migration[6.0]
  def change
    create_table :venders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :genre_id, null: false
      t.text :introduction
      t.text :residence, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
