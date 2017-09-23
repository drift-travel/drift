FactoryGirl.define do
  sequence :email do |n|
    "ernest#{n}@drift.travel"
  end

  factory :user, class: Drift::Models::User do
    email
    password 'traveler'
  end
end
