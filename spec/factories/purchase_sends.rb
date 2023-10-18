FactoryBot.define do
  factory :purchase_send do
    token           {'tok_abcdefghijk00000000000000000'}
    post_code       { '000-0000' }
    prefecture_id   { 2 }
    city_name       { '渋谷区' }
    street_address  { '松濤2-11-15' }
    building        { '西野' }
    phone_number    { '09012345678' }
  end
end