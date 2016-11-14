class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :reviews_count, :integer,  default: 0
  end
end
