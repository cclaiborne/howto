json.array!(@steps) do |step|
  json.extract! step, :id, :title, :body
  json.url step_url(step, format: :json)
end
