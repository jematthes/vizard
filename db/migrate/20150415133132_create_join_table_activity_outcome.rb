class CreateJoinTableActivityOutcome < ActiveRecord::Migration
  def change
    create_join_table :activities, :outcomes do |t|
      t.index [:activity_id, :outcome_id]
      t.index [:outcome_id, :activity_id]
    end
  end
end
