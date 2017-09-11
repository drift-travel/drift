FactoryGirl.define do
  factory :trip, class: Gone::Models::Trip do
    name 'Trip to London'
    user
  end
end
