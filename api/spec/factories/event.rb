FactoryBot.define do
  factory :event do
    title { FFaker::Lorem.sentence }
    date_start { Date.today }
    date_end { date_start + 2.days }
  end
end
