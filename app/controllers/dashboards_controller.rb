class DashboardsController < ApplicationController
  def show
    @item = Item.new
  end
end
