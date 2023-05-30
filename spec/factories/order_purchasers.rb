FactoryBot.define do
  factory :order_purchaser do
    post_code { '123-4567' }
    prefecture_id { '2' }
    city { '市町村' }
    address { '1-1' }
    phone_number { '09012345678' }
    building { 'ビル' }
    token { 'test' }
  end
end
