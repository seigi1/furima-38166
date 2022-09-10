FactoryBot.define do
  factory :item do
    item_name           { 'test' }
    explanation         { 'これはテストです' }
    category_id         { '1' }
    content_id          { '1' }
    deliver_charge_id   { '1' }
    deliver_day_id      { '1' }
    prefecture_id       { '1' }
    price               { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
