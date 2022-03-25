FactoryBot.define do
  factory :user do
    username { Faker::GreekPhilosophers.name }
    email { Faker::Internet.email }
  end
end
