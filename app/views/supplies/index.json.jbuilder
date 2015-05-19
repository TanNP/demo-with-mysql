json.array!(@supplies) do |supply|
  json.extract! supply, :id, :companyName, :contactname, :phone, :email, :address, :product_id
  json.url supply_url(supply, format: :json)
end
