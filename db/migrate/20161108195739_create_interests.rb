class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :genre
      t.timestamps
    end
    add_index :genre, unique: true
  end
end
