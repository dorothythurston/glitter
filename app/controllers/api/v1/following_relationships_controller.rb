class Api::V1::FollowingRelationshipsController < Api::V1::BaseController
  def create
    followed_user = User.find(params[:id])
    following_relationship =  current_user.follow followed_user
    if following_relationship.save
      notify_followers(following_relationship, followed_user)
      current_user.add_recent_activities(followed_user)
      render json: { followers: followed_user.followers.count }
    end
  end

  def destroy
    followed_user  = User.find(params[:id])
    current_user.unfollow followed_user
    render json: { followers: followed_user.followers.count }
  end
end
