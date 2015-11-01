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

  def actor_email
    actor.email
  end
end
