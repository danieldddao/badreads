class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :approx_time
      t.datetime :start_time
      t.timestamps
    end
    create_table :meetings_interests, id: false do |t|
      t.belongs_to :meeting, index: true
      t.belongs_to :interest, index: true
    end
  end
end
