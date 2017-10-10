FactoryGirl.define do
  sequence :email do |n|
    "ernest#{n}@carto.travel"
  end

  factory :user, class: Carto::Models::User do
    email
    password 'traveler'
  end
end
