class FollowerNotifier
  def initialize(user)
    @user = user
  end

  def notify(subject, target)
    if subject.persisted?
      user.followers.each do |follower|
        follower.activities.create(
          subject: subject,
          type: type(subject),
          actor: user,
          target: target
        )
      end
      add_own_activity(subject, target)
    end
  end

  def add_own_activity(subject, target)
    user.activities.create(
      subject: subject,
      type: type(subject),
      actor: user,
      target: target
    )
  end

  private

  attr_reader :user

  def type(subject)
    "#{subject.class}Activity"
  end
end
