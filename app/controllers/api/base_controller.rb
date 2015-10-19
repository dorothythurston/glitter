class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_filter :authorize_access_token

  private

  def authorize_access_token
    unless valid_access_token?
      render nothing: true, status: 404
    end
  end

  def valid_access_token?
    request.headers["X-ACCESS-TOKEN"] == ENV.fetch("ACCESS_TOKEN")
  end
end
