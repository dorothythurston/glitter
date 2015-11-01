class Item < ActiveRecord::Base
  belongs_to :user
  has_many :glitterings, as: :glitterable, dependent: :destroy
  has_many :activities, as: :subject, dependent: :destroy

  def self.paginated(page, per)
    page(page).per(per)
  end

  def self.recent
    order(created_at: :desc)
  end
end
