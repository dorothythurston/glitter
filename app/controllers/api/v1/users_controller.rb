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

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def session_errors
    serialize_errors [t(:invalid_login)]
  end
end
