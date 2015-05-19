json.array!(@comments) do |comment|
  json.extract! comment, :id, :title, :author, :rating, :content, :product_id
  json.url comment_url(comment, format: :json)
end
