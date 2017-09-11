FactoryGirl.define do
  sequence :email do |n|
    "ernest#{n}@gone.travel"
  end

  factory :user, class: Gone::Models::User do
    email
  end
end
