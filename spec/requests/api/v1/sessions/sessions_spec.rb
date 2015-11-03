require "rails_helper"

RSpec.describe "POST /v1/session" do
  context "with valid credentials" do
    it "responds with the user data" do
      user = create(
        :user,
        email: "g@g.com",
        password_digest: "iamgalactus"
      )

      json_post "/v1/session", session: {
        email: "g@g.com",
        password: "iamgalactus",
      }

      expect(json_response).to eq({ current_user: {
        id: user.id,
        username: user.username,
        email: user.email,
        api_token: user.api_token,
        device_token: user.device_token,
      }}.as_json)
    end
  end

  context "with invalid credentials" do
    it "responds with an error" do
      json_post "/v1/session", session: {
        email: "galactus",
        password: "iamgalactus",
      }

      expect(response.status).to eq 422
      expect(json_response).to eq({
        errors: [{ message: I18n.t(:invalid_login) }]
      }.as_json)
    end
  end
end
