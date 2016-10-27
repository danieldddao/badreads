class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :position
      t.string :position_code
      t.timestamp
    end
    add_index :roles, :position_code, unique:true
  end
end
