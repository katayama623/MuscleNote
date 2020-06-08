class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments
  has_many :favorites
  has_many :books
  has_many :booked_users, through: :books, source: :user

  enum part: [:part0, :part1, :part2, :part3, :part4, :part5, :part6, :part7, :part8]
  # 0=胸 1=背中 2=肩 3=腕 4=腹筋 5=太腿 6=上半身全体 7=下半身全体 8=その他

  enum strong: [:strong0, :strong1, :strong2]
  # 0=軽め 1=普通 2=強め

  attachment :start_image
  attachment :finish_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
