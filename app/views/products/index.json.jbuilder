json.array!(@products) do |product|
  json.extract! product, :id, :name, :category
  json.url product_url(product, format: :json)
end
