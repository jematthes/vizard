class AddIntOutcomeTypeActorTypeToOutcomes < ActiveRecord::Migration
  def change
  	add_column :outcomes, :outcome_type_id, :int
  	add_column :outcomes, :actor_type_id, :int
  end
end
