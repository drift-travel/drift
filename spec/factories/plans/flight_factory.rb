FactoryGirl.define do
  factory :flight, class: 'Carto::Models::Plans::Flight', parent: :plan do
    airline 'DL'
    number '1234'
    departure_location 'Bradley International Airport'
    departure_time { DateTime.now }
    arrival_location 'London Heathrow Airport'
    arrival_time { DateTime.now + 6.hours }
  end
end
