class ItemsController < ApplicationController
  def create
    item = current_user.items.create(item_params)
    redirect_to item
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:text)
  end
end
