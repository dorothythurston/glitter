require 'rails_helper'

describe "POST /v1/users" do
  it "creates an user" do

    json_post "/v1/users", user: {
      username: "validusername",
      email: "test@test.com",
      password: "test",
    }

    user = User.last
    expect(user.email).to eq("test@test.com")

    expect(json_response).to eq({ current_user: {
      id: user.id,
      username: user.username,
      email: user.email,
      api_token: user.api_token,
      device_token: user.device_token,
    }}.as_json)
  end
end

describe "GET /v1/users/:id" do
  it "returns a user, their followers, and their items" do
    user = create(:user)
    item = create(:item, user_id: user.id)
    following_user = create(:user)
    following_user.follow(user)

    json_get "/v1/users/#{user.id}", user: {
      id: user.id
    }, api_token: user.api_token

    expect(json_response).to eq( {user: {
      username: user.username,
      email: user.email,
      followers: [following_user.id],
      items: user.items.recent.as_json
    }}.as_json)
  end
end


describe "GET /v1/users" do
  it 'returns a list of users' do
    user = create(:user)
    other_user = create(:user)

    json_get '/v1/users',
      api_token: user.api_token

    expect(response.status).to eq 200
    expect(json_response.length).to eq(2)
  end
end


describe "POST /v1/users/id/follow" do
  it "creates a following relationship and adds followed users recent activities to current user's" do
    user = create(:user)
    followed_user = create(:user)

    json_post "/v1/items", item: {
      text: "example_text"
    }, api_token: followed_user.api_token

    json_post "/v1/users/#{followed_user.id}/follow", user: {
      id: followed_user.id
    }, api_token: user.api_token

    expect(response.status).to eq 200
    activity = user.activities.where(actor_id: followed_user.id)
    expect(FollowingRelationship.last.followed_user_id).to eq followed_user.id
    expect(json_response).to eq({
      followers: 1
    }.as_json)
    expect(activity).not_to eq([])
  end
end


describe "DELETE /v1/users/id/unfollow" do
  it "deletes a following relationship" do
    user = create(:user)
    followed_user = create(:user)
    user.follow(followed_user)

    json_delete "/v1/users/#{followed_user.id}/unfollow", user: {
      id: followed_user.id
    }, api_token: user.api_token

    expect(response.status).to eq 200
    expect(FollowingRelationship.all).to eq []
    expect(json_response).to eq({
      followers: 0
    }.as_json)
  end
end
