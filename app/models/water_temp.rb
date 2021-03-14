class WaterTemp < ActiveHash::Base
  self.data = [

    { id: 2, name: '20度~' },
    { id: 3, name: '17度前後' },
    { id: 4, name: '15度前後' },
    { id: 5, name: '13度前後' },
    { id: 6, name: '10度前後' },
    { id: 7, name: '10度〜' }
  ]
  include ActiveHash::Associations
  has_many :posts
end
