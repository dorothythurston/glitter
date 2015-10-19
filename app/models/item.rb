class Item < ActiveRecord::Base
  belongs_to :user
  has_many :glitterings, as: :glitterable, dependent: :destroy
end
