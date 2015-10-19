class DashboardsController < ApplicationController
  def show
    @item = Item.new
    @items = Item.all
  end
end
