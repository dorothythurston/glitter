require 'rails_helper'

describe "POST /v1/items/1/glitter" do
  it "glitters an item and notifies followers" do
    user = create(:user, id: 1)
    create(:item, id: 1, user_id: 1)
    follower = create(:user)
    follower.follow(user)

    json_post "/v1/items/1/glitter", item: {
      id: 1,
    }, api_token: user.api_token


    expect(response.status).to eq 200
    expect(Activity.last.actor_id).to eq(user.id)
  end
end
