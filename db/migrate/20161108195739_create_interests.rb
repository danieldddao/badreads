class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :genre
      t.references 'user'
      t.timestamps
    end
  end
end
