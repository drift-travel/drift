FactoryGirl.define do
  factory :lodging, class: 'Drift::Models::Plans::Lodging', parent: :plan do
    location_name "Scribner's Catskill Lodge"
  end
end
