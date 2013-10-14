json.array!(@todolists) do |todolist|
  json.extract! todolist, :content, :priority
  json.url todolist_url(todolist, format: :json)
end
