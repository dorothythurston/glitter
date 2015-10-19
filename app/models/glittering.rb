class Glittering < ActiveRecord::Base
  belongs_to :user
  belongs_to :glitterable, polymorphic: true
end
