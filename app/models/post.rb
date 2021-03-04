class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :visit_time
  belongs_to_active_hash :congestion_rate
  belongs_to_active_hash :sauna_temp
  belongs_to_active_hash :water_temp
  belongs_to_active_hash :pref
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy, dependent: :destroy

  with_options presence: true do
    validates :spa_name
    validates :visit_time_id
    validates :congestion_rate_id
    validates :image
    validates :sauna_temp_id
    validates :water_temp_id
    validates :pref_id
  end
  with_options numericality: { other_than: 1 } do
    validates :visit_time_id
    validates :congestion_rate_id
    validates :sauna_temp_id
    validates :water_temp_id
    validates :pref_id
  end
  validates :review, length: { maximum: 1000 }
  validates :spa_name, length: { maximum: 40 }
  
  
end
