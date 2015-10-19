require 'rails_helper'

describe "Items API" do
  it 'sends a list of items' do
    user = create(:user, :id => 1)
    sign_in(user)

    3.times do
      create(:item)
    end

    get '/v1/items'

    expect(response.status).to eq 200

    expect(json.length).to eq(3)
  end
end
