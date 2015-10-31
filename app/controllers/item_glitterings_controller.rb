class ItemGlitteringsController < ApplicationController
  def create
    @item = Item.find(params[:id])
    glitter = current_user.glitter @item
    if glitter.save
      notify_followers(glitter, @item)
    end
    redirect_to @item
  end
end
