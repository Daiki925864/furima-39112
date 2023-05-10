FactoryBot.define do

  factory :item do
    association :user
    name                {"オムライス"}
    content             {"おいしい"}
    category_id         {2}
    condition_id        {2}
    delivery_fee_id     {2}
    prefecture_id       {2}
    delivery_date_id    {2}
    price               {500}
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
  
end
