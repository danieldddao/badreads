class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :isbn, :limit => 13
      t.string :title
      t.string :author
      t.string :publisher
      t.text :summary
      t.integer :publication_year, :limit => 4
      t.string :category
      t.string :edition 
      t.integer :search_count, :default => 0
      t.timestamps
    end
    add_index :books, :isbn, unique:true
  end
end
