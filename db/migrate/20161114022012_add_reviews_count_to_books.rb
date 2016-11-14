class AddReviewsCountToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :reviews_count, :integer
  end
end
