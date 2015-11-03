class FollowingRelationshipActivity < Activity
  def follower_username
    actor.username
  end

  def followed_user_username
    target.username
  end
end
