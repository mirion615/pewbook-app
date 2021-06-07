class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :quizzes
  has_one_attached :avatar

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i, message: '英数字混合で登録してください' } do
    validates :password
  end

  validates :nickname, presence: true, length: { maximum: 10 }
  
end
