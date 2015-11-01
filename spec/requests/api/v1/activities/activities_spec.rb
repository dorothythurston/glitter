require 'rails_helper'

describe "GET /v1/activities" do
  it 'returns a list of current_users activities' do
    user_that_makes_activity = create(:user)
    follower = create(:user)
    follower.follow(user_that_makes_activity)

    create(:activity, user: follower, actor: user_that_makes_activity)
    create(:activity, user: user_that_makes_activity)

    json_get '/v1/activities',
      api_token: follower.api_token

    expect(response.status).to eq 200
    expect(json_response.length).to eq(1)
  end
end

