class Objective < ActiveRecord::Base
  validates :title, presence: true
  has_and_belongs_to_many :solutions
  has_many :outcomes
end
