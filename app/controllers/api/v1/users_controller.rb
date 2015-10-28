class Api::V1::UsersController < Api::V1::BaseController
skip_before_action :authenticate_with_api_token, only: [:create]

  def create
    user = sign_up(user_params)

    if user.valid?
      render json: user, serializer: CurrentUserSerializer
    else
      render json: session_errors, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
