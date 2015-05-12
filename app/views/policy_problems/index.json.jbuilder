json.array!(@policy_problems) do |policy_problem|
  json.extract! policy_problem, :id, :title, :description, :real_problem_id
  json.url real_problem_policy_problems_url(policy_problem, format: :json)
end
