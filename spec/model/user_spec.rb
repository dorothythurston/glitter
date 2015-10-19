require "rails_helper"

RSpec.describe User, "creation" do
  it "sets an api_token" do
    allow(SecureRandom).to receive(:hex).
      and_return("secure_api_token")
    user = create(:user)

    expect(user.api_token).to eq("secure_api_token")
  end

  it "ensures the api_token is unique" do
    allow(SecureRandom).to receive(:hex).
      and_return("secure_api_token", "secure_api_token", "new_token")
    create(:user)
    user = create(:user)

    expect(user.api_token).to eq("new_token")
  end
end
