class Ask < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :activity
end
