class Objective < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :project
  has_and_belongs_to_many :solutions
  has_and_belongs_to_many :actors
  has_many :outcomes
end
