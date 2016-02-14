require 'factory_girl'

FactoryGirl.define do
  factory :example_model do
    value nil

    trait :with_value do
      value { rand(100) }
    end
  end
end
