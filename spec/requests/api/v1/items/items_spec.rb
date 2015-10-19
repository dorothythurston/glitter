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
  it "creates an item" do
     user = create(:user, id: 1)

    json_post "/v1/items", item: {
      text: "example_text"
    }, api_token: user.api_token


    expect(response.status).to eq 200
    expect(Item.last.text).to eq ("example_text")
  end
end
