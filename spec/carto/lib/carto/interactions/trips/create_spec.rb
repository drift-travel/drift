describe Carto::Interactions::Trips::Create, type: :interaction do
  let(:user) { create(:user) }
  let(:action) do
    described_class.run(
      current_user: user,
      trip: {
        name: 'Antarctic Expedition',
        start_date: Date.today,
        end_date: Date.today + 1.week
      }
    )
  end

  it 'creates a trip' do
    expect(action.result).to be_a Carto::Models::Trip
  end

  it 'creates a trip with the correct information' do
    expect(action.result.user).to eql user
    expect(action.result.name).to eql 'Antarctic Expedition'
  end
end
