class Outcome < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :objective
  has_and_belongs_to_many :activities
end
