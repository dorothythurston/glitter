class User < ActiveRecord::Base
  before_validation :set_api_token, on: :create

  validates :username, presence: true, uniqueness: true
  validates_length_of :username, maximum: 15, message: "must be less than 15 characters"
  validates :email, email: true, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :items

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship",
    dependent: :destroy

  has_many :followers, through: :follower_relationships
  has_many :glitterings, dependent: :destroy
  has_many :glittered_items, through: :glitterings, source: :glitterable, source_type: 'Item'
  has_many :activities

  def follow(user)
    follow = followed_user_relationships.create(followed_user: user)
  end

  def following?(user)
    followed_user_ids.include? user.id
  end

  def unfollow(user)
    followed_users.destroy user
    remove_unfollowed_user_related_activities(user)
  end

  def glitter(target)
    glittering = glitterings.create(glitterable: target)
  end

  def glittered?(target)
    glitterings.exists?(glitterable: target)
  end

  def add_recent_activities(followed_user)
    recent_activities = Activity.recent_by_user(followed_user)
    recent_activities.each do |activity|
      self.activities.create(
        subject: activity.subject,
        type: type(activity.subject),
        actor: activity.user,
        target: activity.target,
        created_at: activity.created_at
      )
    end
  end

  def remove_unfollowed_user_related_activities(unfollowed_user)
    user_related_activities = self.activities.where(actor_id: unfollowed_user.id)
    activities.destroy user_related_activities
  end

  private

  def type(subject)
    "#{subject.class}Activity"
  end

  def set_api_token
    begin
      self.api_token = SecureRandom.hex
    end while User.exists?(api_token: api_token)
  end
end
