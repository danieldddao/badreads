class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :star, :limit => 5
      t.text :comment
      t.references 'book'
      t.references 'user'
    end
  end
end
