FactoryBot.define do
  factory :item do
    name    { Faker::Name.name }
    price   { Faker::Number.between(from: 50, to: 300) }
    category
  end
end

