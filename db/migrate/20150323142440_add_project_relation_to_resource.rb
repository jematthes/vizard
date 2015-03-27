class AddProjectRelationToResource < ActiveRecord::Migration
	def change
		add_reference :resources, :project, index: true
	end
end