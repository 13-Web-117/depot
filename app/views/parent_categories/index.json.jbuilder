json.array!(@parent_categories) do |parent_category|
  json.extract! parent_category, :name
  json.url parent_category_url(parent_category, format: :json)
end
