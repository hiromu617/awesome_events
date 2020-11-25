FactoryBot.define do
  factory :event do
    owner
    sequence(:name)
    sequence(:place)
    sequence(:content)
    start_at { rand(1..30).days.from_now }
    end_at {start_at + rand(1..30).hours}
  end
end
