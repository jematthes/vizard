class Project < ActiveRecord::Base
  has_many :resources, dependent: :destroy
  accepts_nested_attributes_for :resources, :allow_destroy => true
end
