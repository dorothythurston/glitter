class Api::V1::ItemsController < Api::V1::BaseController
  def index
    @items = Item.all
  end

  def create
    item = current_user.items.create(item_params)
    render json: { success: true }
  end

  private

  def item_params
    params.require(:item).permit(
      :text,
    )
  end
end
