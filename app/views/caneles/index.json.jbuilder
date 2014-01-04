json.array!(@caneles) do |canele|
  json.extract! canele, :id, :name, :price, :started_from, :discontinued_in
  json.url canele_url(canele, format: :json)
end
