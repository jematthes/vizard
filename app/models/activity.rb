class Activity < ActiveRecord::Base
  validates :title, presence: true
  has_and_belongs_to_many :outcomes
  has_many :asks
end
