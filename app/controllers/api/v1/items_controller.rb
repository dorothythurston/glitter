class Api::V1::ItemsController < Api::V1::BaseController
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def create
    item = current_user.items.create(item_params)
    render json: { success: true }
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: { success: true }
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :text,
    )
  end
end
