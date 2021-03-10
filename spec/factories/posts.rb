FactoryBot.define do
  factory :post do
    spa_name              {'test'}
    congestion_rate_id    {2}
    visit_time_id         {2}
    water_temp_id         {2}
    sauna_temp_id         {2}
    pref_id               {2}
    chair_count_id        {2}
    review                {"test"}
    association :user
    after(:build) do |post|
      post.image.attach(io: File.open('public/test_image.png'),filename: 'test_image.png')
  end
end
end
