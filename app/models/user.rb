class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :thumb => "50x50#" }
  validates_attachment_content_type :avatar, :content_type => /^image\/(png|jpg|jpeg)/

  validates :first_name, :last_name, :age, :mobile_number, presence: true
  validates :auth_token, uniqueness: true
end
