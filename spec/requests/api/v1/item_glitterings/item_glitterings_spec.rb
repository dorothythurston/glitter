require 'rails_helper'

describe "POST /v1/items/1/glitter" do
  it "glitters an item" do
    user = create(:user, id: 1)
    create(:item, id: 1, user_id: 1)

    json_post "/v1/items/1/glitter", item: {
      id: 1,
    }, api_token: user.api_token


    expect(response.status).to eq 200
  end
end
