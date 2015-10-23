class Api::V1::ItemGlitteringsController < Api::V1::BaseController
  def create
    item = Item.find(params[:id])
    current_user.glitter item
    render json: { success: true }
  end
end
