FactoryGirl.define do
  sequence :email do |n|
    "ernest#{n}@arrow.travel"
  end

  factory :user, class: Arrow::Models::User do
    email
  end
end
