class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Monban::ControllerHelpers

  def notify_followers(subject, target)
    follower_notifier = FollowerNotifier.new(current_user)
    follower_notifier.notify(subject, target)
  end
end
