json.array!(@asks) do |ask|
  json.extract! ask, :id, :title, :description, :activity_id
  json.url ask_url(ask, format: :json)
end
