class RealProblem < ActiveRecord::Base
  validates :title, presence: true
  has_many :policy_problems, dependent: :destroy

  def to_graph_json 
    policy_problem_list = []
    policy_problems.each do |policy_problem|
      solution_list = []
      policy_problem.solutions.each do |solution|
        solution_hash =
        {
          "title" => solution.title
        }
        solution_list.append solution_hash
      end
      policy_problem_hash =
        {
          "title" => policy_problem.title,
          "solutions" => solution_list
        }
      policy_problem_list.append policy_problem_hash
    end
    
    json = { "real_problem" => { "title" => self.title },
        "policy_problems" => policy_problem_list
      }.to_json
    
    return json
  end

  def get_solutions
    policy_problem_list = []

    policy_problems.each do |pp|
      pp.solutions.each do |s|
        policy_problem_list << s
      end
    end

    return policy_problem_list
  end

  def get_solution
    pp = policy_problems.first.solutions.first

    return pp
  end
end
