class Api::V1::ItemGlitteringsController < Api::V1::BaseController
  def create
    item = Item.find(params[:id])
    glitter = current_user.glitter item
    notify_followers(glitter, item)
    if glitter.save
      render json: { success: true }
    end
  end
end
