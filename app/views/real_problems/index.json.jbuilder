json.array!(@real_problems) do |real_problem|
  json.extract! real_problem, :id, :title, :description
  json.url real_problem_url(real_problem, format: :json)
end
