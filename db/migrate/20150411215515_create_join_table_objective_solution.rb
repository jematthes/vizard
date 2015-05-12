class CreateJoinTableObjectiveSolution < ActiveRecord::Migration
  def change
    create_join_table :objectives, :solutions do |t|
      t.index [:objective_id, :solution_id]
      t.index [:solution_id, :objective_id]
    end
  end
end
