FactoryGirl.define do
  factory :activity, class: 'Carto::Models::Plans::Activity', parent: :plan do
    description 'Tate Modern Tour'
    start_time { DateTime.now }
    end_time { DateTime.now + 2.hours }
  end
end
