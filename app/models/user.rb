class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :booked_posts, through: :books, source: :post

  attachment :profile_image

  def already_booked?(post)
    self.books.exists?(post_id: post.id)
  end
end
