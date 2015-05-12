json.array!(@actors) do |actor|
  json.extract! actor, :id, :name, :description, :actor_type, :support, :influence
  json.url actor_url(actor, format: :json)
end
