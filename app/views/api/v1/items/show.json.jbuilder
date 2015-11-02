json.item do
  json.text @item.text
  json.user_id @item.user.id
  json.glitter_count @item.glitterings.count
  json.user_email @item.user.email
  json.id @item.id
  json.created_at @item.created_at
  json.current_user_glittered current_user.glittered?(@item)
end
