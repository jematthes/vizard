class CreatePolicyProblems < ActiveRecord::Migration
  def change
    create_table :policy_problems do |t|
      t.text :title
      t.text :description
      t.references :real_problem, index: true

      t.timestamps
    end
  end
end
