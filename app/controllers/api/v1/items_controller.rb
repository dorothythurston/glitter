class Api::V1::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end
end
