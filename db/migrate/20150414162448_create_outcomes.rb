class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.text :title
      t.text :description
      t.references :objective, index: true

      t.timestamps
    end
  end
end
