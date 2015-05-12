class AddPrioritizedToObjective < ActiveRecord::Migration
  def change
    add_column :objectives, :prioritized, :boolean
  end
end
