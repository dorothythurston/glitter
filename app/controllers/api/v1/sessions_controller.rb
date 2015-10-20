class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate_with_api_token, only: [:create]

  def create
    user = authenticate_session(session_params)

    if user
      render json: user, serializer: CurrentUserSerializer
    else
      render json: session_errors, status: 422
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def session_errors
    serialize_errors [t(:invalid_login)]
  end
end
