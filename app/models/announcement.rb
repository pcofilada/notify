class Announcement < ActiveRecord::Base
  belongs_to :channel

  validates :title, :message, presence: true
  validates :message, length: { maximum: 140 }
end
