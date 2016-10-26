class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :role
      t.string :session_token
      t.timestamps
    end
    add_index :users, :email, unique:true
  end
end
