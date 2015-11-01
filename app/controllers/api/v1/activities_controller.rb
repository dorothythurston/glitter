class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    @activities = current_user.activities.recent
  end
end

