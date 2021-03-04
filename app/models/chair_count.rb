class ChairCount < ActiveHash::Base
  self.data=[
    
    {id: 2, name: 'なし'}, 
    {id: 3, name: '少ない'},
    {id: 4, name: '普通'},
    {id: 5, name: '多い'}
  ]
  include ActiveHash::Associations
    has_many :posts
end 