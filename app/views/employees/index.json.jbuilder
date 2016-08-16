json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :company_id
  json.url employee_url(employee, format: :json)
end
