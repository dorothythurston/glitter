json.array! @items do |item|
  json.text item.text
  json.user item.user.email
  json.glitter_count item.glitterings.count
end
