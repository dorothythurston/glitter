class DashboardsController < ApplicationController
  def show
    @item = Item.new
    @activities = current_user.activities.recent.paginated(params[:page], 3)
  end
end
