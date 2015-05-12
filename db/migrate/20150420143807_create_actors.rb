class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.text :description
      t.string :actor_type
      t.integer :support
      t.integer :influence

      t.timestamps
    end
  end
end
