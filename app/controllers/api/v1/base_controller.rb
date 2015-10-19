class Api::V1::BaseController < Api::BaseController
  before_action :authenticate_with_api_token

  private

  def authenticate_with_api_token
    @current_user ||= User.find_by!(api_token: api_token)
  end

  def api_token
    request.headers["X-API-TOKEN"]
  end
end
