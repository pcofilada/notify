class Channel < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_many :announcements

  has_attached_file :logo, :styles => { :thumb => "50x50#" }
  validates_attachment_content_type :logo, :content_type => /^image\/(png|jpg|jpeg)/

  validates :logo, :status, :title, :description, :category, :owner, presence: true
end
