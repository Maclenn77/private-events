FactoryBot.define do
  factory :random_event, class: 'Event' do
    location { Faker::Address.street_address }
    description { Faker::Movies::StarWars.quote }
    date { Faker::Date.backward(1) }
    creator_id { 1 }
  end
end
