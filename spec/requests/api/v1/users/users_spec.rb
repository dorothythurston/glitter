require 'rails_helper'

describe "POST /v1/users" do
  it "creates an user" do

    json_post "/v1/users", user: {
      email: "test@test.com",
      password: "test",
    }


    expect(response.status).to eq 200
    expect(User.last.email).to eq ("test@test.com")
  end
end
