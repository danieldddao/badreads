class AddInHoldToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :in_hold, :boolean, default: false
  end
end
