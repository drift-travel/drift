FactoryGirl.define do
  factory :plan, class: Carto::Models::Plan do
    canonical_start { DateTime.now }
    trip
  end
end
