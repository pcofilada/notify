class User < ActiveRecord::Base
  before_create :generate_authentication_token!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :thumb => "50x50#" }
  validates_attachment_content_type :avatar, :content_type => /^image\/(png|jpg|jpeg)/

  validates :first_name, :last_name, :age, :mobile_number, presence: true
  validates :auth_token, uniqueness: true

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
