class ItemGlitteringsController < ApplicationController
  def create
    @item = Item.find(params[:id])
    glitter = current_user.glitter @item
    redirect_to @item
  end
end
