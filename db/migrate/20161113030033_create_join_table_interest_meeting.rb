class CreateJoinTableInterestMeeting < ActiveRecord::Migration[5.0]
  def change
    create_join_table :interests, :meetings do |t|
       t.index [:interest_id, :meeting_id]
       t.index [:meeting_id, :interest_id]
    end
  end
end
