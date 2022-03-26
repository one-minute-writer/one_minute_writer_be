FactoryBot.define do
  factory :story do
    user
    title { Faker::Lorem.word }
    total_time_in_seconds { Faker::Number.number(digits: 3) }
    body_text { Faker::Lorem.paragraph(sentence_count: 4) }
    word { Faker::Lorem.word }
    image { Faker::Internet.url }
    sound { Faker::Internet.url }
  end
end
