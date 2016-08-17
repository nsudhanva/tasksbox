json.array!(@departments) do |department|
  json.extract! department, :id, :name
  json.url department_url(department, format: :json)
end
