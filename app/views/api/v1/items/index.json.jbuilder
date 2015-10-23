json.array! @items do |item|
  json.text item.text
  json.user item.user.email
  json.glitter_count item.glitterings.count
  json.id item.id
  json.created_at item.created_at
end
