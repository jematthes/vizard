class AddNameAndDescriptionToResource < ActiveRecord::Migration
	def change
		add_column :resources, :title, :string
		add_column :resources, :description, :text
		add_column :resources, :public, :boolean
	end
end