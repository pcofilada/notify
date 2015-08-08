class Announcement < ActiveRecord::Base
  belongs_to :channel

  validates :title, :message, :channel, presence: true
  validates :message, length: { maximum: 140 }
end
