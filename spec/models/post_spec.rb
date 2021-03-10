require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

describe "投稿機能" do
  context "投稿機能が正常に挙動しないとき" do
  it "imageが空では保存できない" do
    @post.image=nil
    @post.valid?
    expect(@post.errors.full_messages).to include("Image can't be blank")
   end
   it "spa_nameが空では保存できない" do
    @post.spa_name= ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Spa name can't be blank")
   end
   it "spa_nameが40文字以上では保存できない" do
    @post.spa_name="あ" * 41
    @post.valid?
    expect(@post.errors.full_messages).to include("Spa name is too long (maximum is 40 characters)")
   end
   it "visit_time_idが空では保存できない" do
    @post.visit_time_id= ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Visit time can't be blank")
   end
   it "congestion_rate_idが空では保存できない" do
    @post.congestion_rate_id= ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Congestion rate can't be blank")
   end
   it "water_temp_idが空では保存できない" do
    @post.water_temp_id= ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Water temp can't be blank")
   end
   it "sauna_temp_idが空では保存できない" do
    @post.sauna_temp_id= ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Sauna temp can't be blank")
   end
   it "pref_idが空では保存できない" do
    @post.pref_id= ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Pref can't be blank")
   end
   it "chair_count_idが空では保存できない" do
    @post.chair_count_id= ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Chair count can't be blank")
   end
   it "reviewが1000文字以上では保存できない" do
    @post.review="あ" * 1001
    @post.valid?
    expect(@post.errors.full_messages).to include("Review is too long (maximum is 1000 characters)")
   end
  end
  context "投稿機能が正常に挙動する時" do
    it "すべての情報が登録できる時" do
      expect(@post).to be_valid
  end
end
end
end
