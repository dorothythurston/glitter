 class CurrentUserSerializer < ActiveModel::Serializer
   attributes :id, :username, :email, :api_token, :device_token
 end
