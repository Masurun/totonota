class SaunaTemp < ActiveHash::Base
  self.data=[
    
    {id: 2, name: '~80度'}, 
    {id: 3, name: '80~85度'},
    {id: 4, name: '85~90度'},
    {id: 5, name: '95~100度'},
    {id: 6, name: '100度~'}
  ]
  include ActiveHash::Associations
    has_many :posts
end 