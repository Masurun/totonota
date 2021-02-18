class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :visit_time
  belongs_to :congestion_rate
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :spa_name
    validates :features
    validates :visit_time_id
    validates :congestion_rate_id
  end
  with_options numericality: { other_than: 1 } do
    validates :visit_time_id
    validates :congestion_rate_id
  end
  belongs_to :user
  has_one_attached :image
  validates :review, length: { maximum: 1000 }
  validates :strange_person, length: { maximum: 100 }
  validates :spa_name, length: { maximum: 40 }
  def self.search(search)
    if search != ""
      Post.where('spa_name LIKE(?)',"%#{search}%")
    else
      Post.all.includes(:user).order('created_at DESC')
  end
  end
end
