json.user do
  json.email @user.email
  json.followers @user.follower_ids
end
