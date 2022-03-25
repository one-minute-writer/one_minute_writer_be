FactoryBot.define do
  factory :story do
    user_id { Faker::Number.number(digits: 2) }
    total_time { Faker::Number.number(digits: 3) }
    body_text { Faker::Lorem.paragraph(sentence_count: 4) }
    image { Faker::Lorem.sentence }
    words { Faker::Lorem.words(number: 4) }
    sound { Faker::Lorem.sentence }
  end
end
