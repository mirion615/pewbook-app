class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :quizzes
  has_many :rankings
  has_one_attached :avatar

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i, message: '英数字混合で登録してください' } do
    validates :password, on: :create
  end

  validates :nickname, presence: true, length: { maximum: 10 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "Guest"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
end
