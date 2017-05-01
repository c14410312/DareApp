class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  has_many :identities
  has_many :votes
  has_many :userdares
  has_many :comments
  has_many :dare_rooms, dependent: :destroy

  validates_processing_of :avatar
  validate :image_size_validation

  def deduct_coins(value)
    self.coins = self.coins - value
    self.save
  end

  def lodge_coins(value)
    self.coins = self.coins + value
    self.save
  end
 
  private
    def image_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

end
