FactoryGirl.define do
  factory :trip, class: Arrow::Models::Trip do
    name 'Trip to London'
    user
  end
end
