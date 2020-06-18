class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :booked_users, through: :books, source: :user

  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 500}
  validates :tag_list, presence: true

  enum part: [:part0, :part1, :part2, :part3, :part4, :part5, :part6, :part7, :part8]
  # 0=胸 1=背中 2=肩 3=腕 4=腹筋 5=太腿 6=上半身全体 7=下半身全体 8=その他

  enum strong: [:strong0, :strong1, :strong2]
  # 0=軽め 1=普通 2=強め

  attachment :start_image
  attachment :finish_image

  # タグ付
  acts_as_taggable

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
      if search
        Post.where(['title LIKE ?', "%#{search}%"])
      else
        Post.all
      end
    end

end
