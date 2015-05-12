class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.text :title
      t.text :description
      t.references :activity, index: true

      t.timestamps
    end
  end
end
