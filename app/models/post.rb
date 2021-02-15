class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_option presence: true do
    validates :spa_name
    validates :features
    validates :visit_time_id
    validates :congestion_rate_id
  end
  with_option numericality: { other_than: 1 } do
    validates :visit_time_id
    validates :congestion_rate
  end
  belongs_to :user
  has_one_attached :image
  validates :review, length: { maximum: 500 }
  validates :strange_person, length: { maximum: 50 }
  validates :spa_name


end
