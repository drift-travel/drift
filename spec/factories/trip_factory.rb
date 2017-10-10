FactoryGirl.define do
  factory :trip, class: Carto::Models::Trip do
    name 'Trip to London'
    user
  end
end
