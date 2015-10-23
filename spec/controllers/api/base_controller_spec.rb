require "rails_helper"

RSpec.describe Api::BaseController do
  controller do
    def index
      render nothing: true, status: 200
    end

    def create
      render nothing: true, status: 200
    end
  end

  it "does not allow requests without a valid access token" do
    with_env "ACCESS_TOKEN", "secret_token" do
      request.headers["X-ACCESS-TOKEN"] = "other_secret"
      get :index, format: :json

      expect(response.status).to eq 404
    end
  end

  it "skips CSRF protection" do
    with_forgery_protection do
      expect { post :create }.not_to raise_error
    end
  end

  private

  def with_forgery_protection
    old_value = controller.allow_forgery_protection
    controller.allow_forgery_protection = true
    yield
  ensure
    controller.allow_forgery_protection = old_value
  end
end
