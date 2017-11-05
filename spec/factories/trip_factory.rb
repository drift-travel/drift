FactoryGirl.define do
  factory :trip, class: Carto::Models::Trip do
    name 'Trip to London'
    start_date { Date.new(2018, 1, 1) }
    end_date { Date.new(2018, 1, 8) }
    user

    trait :with_plans do
      after(:build) do |trip, evaluator|
        trip.plans << build(:activity, trip_id: trip.id, start_time: DateTime.new(2018, 1, 2, 12, 0, 0), end_time: DateTime.new(2018, 1, 2, 13, 0, 0))
      end
    end
  end
end
