FactoryBot.define do
  factory :random_user, class: 'User' do
    name { Faker::Name.name }
  end

end