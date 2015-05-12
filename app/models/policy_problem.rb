class PolicyProblem < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :real_problem
  has_many :solutions, dependent: :destroy
end
