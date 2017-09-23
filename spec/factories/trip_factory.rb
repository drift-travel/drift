FactoryGirl.define do
  factory :trip, class: Drift::Models::Trip do
    name 'Trip to London'
    user
  end
end
