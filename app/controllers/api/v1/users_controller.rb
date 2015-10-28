class Api::V1::UsersController < Api::V1::BaseController
skip_before_action :authenticate_with_api_token, only: [:create]

  def create
    @user = sign_up(user_params)
    render json: { success: true }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
