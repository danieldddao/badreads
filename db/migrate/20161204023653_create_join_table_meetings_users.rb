class CreateJoinTableMeetingsUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :meetings, :users do |t|
       t.index [:meeting_id, :user_id]
       t.index [:user_id, :meeting_id]
    end
  end
end
