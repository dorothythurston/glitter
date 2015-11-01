require 'rails_helper'

describe "POST /v1/users" do
  it "creates an user" do

    json_post "/v1/users", user: {
      email: "test@test.com",
      password: "test",
    }

    user = User.last
    expect(user.email).to eq("test@test.com")

    expect(json_response).to eq({ current_user: {
      id: user.id,
      email: user.email,
      api_token: user.api_token,
      device_token: user.device_token,
    }}.as_json)
  end
end

describe "GET /v1/users/:id" do
  it "returns a user" do
    user = create(:user)

    json_get "/v1/users/#{user.id}", user: {
      id: user.id
    }, api_token: user.api_token

    expect(json_response).to eq( {user: {
      email: user.email,
      followers: user.followers
    }}.as_json)
  end
end
