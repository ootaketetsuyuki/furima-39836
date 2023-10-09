FactoryBot.define do
  factory :item do
    item_name             { Faker::Lorem.sentence[0..39] }
    description           { Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 5) }
    category_id           { 2 }
    situation_id          { 2 }
    prefecture_id         { 2 }
    address_id            { 2 }
    day_id                { 2 }
    price                 { Faker::Number.between(from: 300, to: 10_000_000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
