class User < ActiveRecord::Base
  before_validation :set_api_token, on: :create

  validates :email, presence: true, uniqueness: true
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
  end

  def glitter(target)
    glittering = glitterings.create(glitterable: target)
  end

  def glittered?(target)
    glitterings.exists?(glitterable: target)
  end

  private

  def set_api_token
    begin
      self.api_token = SecureRandom.hex
    end while User.exists?(api_token: api_token)
  end
end
