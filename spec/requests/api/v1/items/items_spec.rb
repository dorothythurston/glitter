require 'rails_helper'

describe "GET /v1/items" do
  it 'returns a list of items' do
    user = create(:user, id: 1)

    3.times do
      create(:item)
    end

    json_get '/v1/items',
      api_token: user.api_token

    expect(response.status).to eq 200

    expect(json_response.length).to eq(3)
  end
end

describe "POST /v1/items" do
  it "creates an item and notifies user's followers" do
     user = create(:user)
     follower = create(:user)
     follower.follow(user)

    json_post "/v1/items", item: {
      text: "example_text"
    }, api_token: user.api_token

    expect(response.status).to eq 200
    expect(Item.last.text).to eq ("example_text")
    expect(Activity.last.actor_id).to eq(user.id)
  end
end

describe "DELETE /v1/items" do
  it "deletes an item" do
    user = create(:user, id: 1)
    item = create(:item, user_id: 1, id: 1)

    json_delete "/v1/items/1", item: {
      id: 1
    }, api_token: user.api_token

    expect(response.status).to eq 200
    expect(Item.last).to eq(nil)
  end
end


describe "GET /v1/items/:id" do
  it "returns a item" do
    user = create(:user)
    other_user = create(:user)
    item = create(:item, user: user)
    other_user.glitter(item)

    json_get "/v1/items/#{item.id}", item: {
      id: item.id
    }, api_token: other_user.api_token

    expect(json_response).to eq( {item: {
      text: item.text,
      user_id: item.user.id,
      glitter_count: item.glitterings.count,
      user_email: item.user.email,
      id: item.id,
      created_at: item.created_at,
      current_user_glittered: true
    }}.as_json)
  end
end
