class Interests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :genre
    end
  end
end
