FactoryBot.define do
  factory :item do
    name                {'test'}
    description         {Faker::Lorem.sentence}
    category_id         {'2'}
    status_id           {'2'}
    deliver_burden_id   {'2'}
    pref_id             {'2'}
    deliver_date_id     {'2'}
    sell_price          {'1000'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
