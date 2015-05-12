class CreateRealProblems < ActiveRecord::Migration
  def change
    create_table :real_problems do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
