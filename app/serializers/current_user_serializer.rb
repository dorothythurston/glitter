 class CurrentUserSerializer < ActiveModel::Serializer
   attributes :id, :email, :api_token, :device_token
 end
