json.user do
  json.username @user.username
  json.email @user.email
  json.followers @user.follower_ids
  json.items @user.items.recent
end
