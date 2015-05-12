json.array!(@solutions) do |solution|
  json.extract! solution, :id, :title, :description, :real_problem_id, :policy_problem_id
  #json.url real_problem_policy_problem_solutions_url(solution, format: :json)
end
