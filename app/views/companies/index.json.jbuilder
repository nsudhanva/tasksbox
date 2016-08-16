json.array!(@companies) do |company|
  json.extract! company, :id, :name, :email, :website
  json.url company_url(company, format: :json)
end
