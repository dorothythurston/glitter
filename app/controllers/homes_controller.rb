class HomesController < ApplicationController
  before_action :go_to_dashboard

  def show
  end

  private
  def go_to_dashboard
    if signed_in?
      redirect_to dashboard_path
    end
  end
end
