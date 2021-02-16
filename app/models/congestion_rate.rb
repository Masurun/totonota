class CongestionRate < ActiveHash::Base
  self.data=[
    {id: 1, name: '--'},
    {id: 2, name: 'ほぼ無人'}, 
    {id: 3, name: '少ない'},
    {id: 4, name: 'やや少ない'},
    {id: 5, name: '普通'},
    {id: 6, name: 'やや多い'},
    {id: 7, name: '多い'}
  ]
  include ActiveHash::Associations
    has_many :posts
end 