FactoryGirl.define do
  factory :plan, class: Drift::Models::Plan do
    canonical_start { DateTime.now }
    trip
  end
end
