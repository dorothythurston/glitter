class FollowerNotifier
  def initialize(user)
    @user = user
  end

  def notify_follower(subject, target, type)
    if subject.persisted?
      user.followers.each do |follower|
        follower.activities.create(
          subject: subject,
          type: type,
          actor: user,
          target: target
        )
      end
    end
  end

  private
    attr_reader :user
end
