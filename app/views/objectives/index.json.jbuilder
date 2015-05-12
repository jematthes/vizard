json.array!(@objectives) do |objective|
  json.extract! objective, :id, :title, :description
  json.url objective_url(objective, format: :json)
end
