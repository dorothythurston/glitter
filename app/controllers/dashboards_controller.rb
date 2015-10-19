class DashboardsController < ApplicationController
  def show
    @item = Item.new
    @items = Item.recent.paginated(params[:page], 3)
  end
end
