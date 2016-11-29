class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references 'follower'
      t.references 'followedUser'
      t.timestamps
    end
    add_index :follows, [:follower_id, :followedUser_id], unique: true
  end
end
