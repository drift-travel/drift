FactoryGirl.define do
  factory :flight, class: 'Drift::Models::Plans::Flight', parent: :plan do
    after(:build) do |flight, evaluator|
      flight.segments << build(:flight_segment)
    end
  end

  factory :flight_segment, class: 'Drift::Models::Plans::Flight::FlightSegment' do
    airline 'DL'
    number '1234'
    departure_location 'Bradley International Airport'
    departure_time { DateTime.now }
    arrival_location 'London Heathrow Airport'
    arrival_time { DateTime.now + 6.hours }
  end
end
