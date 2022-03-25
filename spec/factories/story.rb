FactoryBot.define do
  factory :story do
    user
    total_time { Faker::Number.number(digits: 3) }
    body_text { Faker::Lorem.paragraph(sentence_count: 4) }
    words { Faker::Lorem.words(number: 4) }
    image { Faker::Internet.url }
    sound { Faker::Internet.url }
  end
end
