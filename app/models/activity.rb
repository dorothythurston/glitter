class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, polymorphic: true
  belongs_to :actor, class_name: "User"
  belongs_to :target, polymorphic: true

  def self.paginated(page, per)
    page(page).per(per)
  end

  def self.recent
    order(created_at: :desc)
  end

  def self.recent_by_user(user)
    where(actor_id: user.id).first(3)
  end

  def actor_username
    actor.username
  end
end
