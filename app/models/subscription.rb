class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  validates :user, :channel, presence: true
  validates :email, :sms, :mobile, inclusion: { in: [true, false] }
  validates :user, uniqueness: { scope: :channel, message: 'already subscribed!' }

  scope :sms_enabled, -> { where(sms: true) }
  scope :email_enabled, -> { where(email: true) }
  scope :mobile_enabled, -> { where(mobile: true) }
end
