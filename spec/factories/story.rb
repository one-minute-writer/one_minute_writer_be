FactoryBot.define do
  factory :story do
    user
    title { Faker::Book.title }
    total_time_in_seconds { Faker::Number.number(digits: 3) }
    body_text { Faker::Lorem.paragraph(sentence_count: 4) }
    word { Faker::Lorem.word }
    image { {download_url: Faker::Internet.url, author: Faker::GreekPhilosophers.name} }
    sound { {src: Faker::Internet.url, title: Faker::Lorem.word } }
  end
end
