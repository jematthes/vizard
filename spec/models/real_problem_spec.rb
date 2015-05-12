require 'rails_helper'

RSpec.describe RealProblem, :type => :model do

  describe "to_graph_json" do
    it "returns a RealProblem in json format" do
      problem = RealProblem.new
      problem.title = "a real world problem" 
      json = { "real_problem" => { "title" => "a real world problem" }, "policy_problems" => [] }.to_json
      expect(problem.to_graph_json).to eq(json)
    end

    it "returns embedded policy problems in the json" do
      real_problem = RealProblem.new
      real_problem.title = "a real world problem"
      policy_problem_1 = PolicyProblem.new
      policy_problem_1.title = "a policy problem"
      policy_problem_2 = PolicyProblem.new
      policy_problem_2.title = "another policy problem"
      real_problem.policy_problems = [policy_problem_1, policy_problem_2]
      json = { "real_problem" => { "title" => "a real world problem" },
        "policy_problems" => [
          {
            "title" =>  "a policy problem",
            "solutions" => []
          },
          {
            "title" =>  "another policy problem",
            "solutions" => []
          }
        ]
      }.to_json
      expect(real_problem.to_graph_json).to eq(json)
    end

    it "returns embedded policy solutions in the json" do
      real_problem = RealProblem.new
      real_problem.title = "a real world problem"
      policy_problem_1 = PolicyProblem.new
      policy_problem_1.title = "a policy problem"
      policy_problem_2 = PolicyProblem.new
      policy_problem_2.title = "another policy problem"
      real_problem.policy_problems = [policy_problem_1, policy_problem_2]
      solution_1 = Solution.new
      solution_1.title = "a solution for policy problem 1"
      solution_2 = Solution.new
      solution_2.title = "another solution for policy problem 1"
      policy_problem_1.solutions = [solution_1, solution_2]
      policy_problem_2.solutions = []

      json = { "real_problem" => { "title" => "a real world problem" } ,
        "policy_problems" => [
          {
            "title" => "a policy problem",
            "solutions" => [
                    {
                        "title" => "a solution for policy problem 1"
                    },
                    {
                        "title" => "another solution for policy problem 1"
                    }
                ]
          },
          {
            "title" => "another policy problem",
            "solutions" => []
          }
        ]
      }.to_json

      expect(real_problem.to_graph_json).to eq(json)
    end

  end

  describe "solutions" do
    it "returns an array with all real problem solutions" do
      @real_problem = create(:real_problem)
      @policy_problem_1 = create(:policy_problem)
      @policy_problem_2 = create(:policy_problem)
      @solution_1 = create(:solution)
      @solution_2 = create(:solution)

      @policy_problem_1.solutions << @solution_1
      @policy_problem_2.solutions << @solution_2
      @real_problem.policy_problems << @policy_problem_1 << @policy_problem_2

      expect(@real_problem.get_solutions).kind_of?(Array)
      expect(@real_problem.get_solutions).to include(@solution_1)
      expect(@real_problem.get_solutions).to include(@solution_2)
    end
  end

  describe "solution" do
    it "returns a solution" do
      @real_problem = create(:real_problem)
      @policy_dimension = create(:policy_problem)
      @policy_solution_1 = create(:solution)

      @real_problem.policy_problems << @policy_dimension
      @policy_dimension.solutions << @policy_solution_1


      expect(@real_problem.get_solution).to be_a(Solution)

    end
  end

end
