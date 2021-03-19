FactoryBot.define do
  factory :tweet do
    message {Faker::Lorem.sentence}
    association :user
  end
end