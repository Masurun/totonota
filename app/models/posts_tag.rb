class PostsTag
  include ActiveModel::Model
  attr_accessor :spa_name,:congestion_rate_id,:visit_time_id,:review,:user_id,:image,:tag_name,:sauna_temp_id,:water_temp_id,:sauna_temp_id,:pref_id
  
  def save
    post = Post.create(spa_name: spa_name,congestion_rate_id: congestion_rate_id,visit_time_id: visit_time_id,
      review: review,user_id: user_id,image: image,sauna_temp_id: sauna_temp_id,water_temp_id: water_temp_id,
      pref_id: pref_id
    )
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    PostTagRelation.create!(post_id: post.id, tag_id: tag.id)
  end

  with_options presence: true do
    validates :spa_name
    validates :congestion_rate_id
    validates :visit_time_id
    validates :user_id
    validates :image
    validates :sauna_temp_id
    validates :water_temp_id
    validates :pref_id
  end
  
end