json.user do
  json.email @user.email
  json.followers @user.followers.count
end