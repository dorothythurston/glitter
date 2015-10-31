class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Monban::ControllerHelpers

  def notify(subject, target, type)
    FollowerNotifier.new(current_user).notify_follower(
      subject,
      target,
      type
    )
  end
end
