class Solution < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :policy_problem
  has_and_belongs_to_many :objectives

  def real_problem_id
    policy_problem.real_problem_id
  end
end
