FactoryBot.define do
  factory :random_event, class: 'Event' do
    location { Faker::Address }
    description { Faker::Quote }
    date { Faker::Date }
    creator_id { 1 }
  end

end