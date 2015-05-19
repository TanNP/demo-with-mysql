json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :img, :price
  json.url product_url(product, format: :json)
end
