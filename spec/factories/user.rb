FactoryBot.define do
  factory :user do
    username { Faker::GreekPhilosophers.name }
    email { Faker::Internet.email }
    dashboard_metrics { {} }
  end
end
