class ItemsController < ApplicationController
  def create
    item = current_user.items.create(item_params)
    if item.save
      notify_followers(item, item)
    end
    redirect_to item
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:text)
  end
end
