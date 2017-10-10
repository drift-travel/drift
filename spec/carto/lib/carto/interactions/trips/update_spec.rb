describe Carto::Interactions::Trips::Update, type: :interaction do
  let(:trip) { create(:trip) }
  let(:user) { trip.user }
  let(:action) do
    described_class.run(
      current_user: user,
      trip: {
        id: trip.id.to_s,
        name: 'Antarctic Expedition',
        start_date: Date.today + 1.week,
        end_date: Date.today + 2.weeks
      }
    )
  end

  context 'with non-existent trip' do
    let(:action) do
      described_class.run(
        current_user: user,
        trip: {
          id: 'foobar'
        }
      )
    end

    it 'adds a not found error' do
      expect(action.errors.details[:trip]).to eql [{ error: 'not found' }]
    end
  end

  context 'with unauthorized user' do
    let(:action) do
      described_class.run(
        current_user: create(:user),
        trip: {
          id: trip.id.to_s
        }
      )
    end

    it 'adds a not authorized error' do
      expect(action.errors.details[:current_user]).to eql [{ error: 'not authorized' }]
    end
  end

  it 'results in a trip' do
    expect(action.result).to be_a Carto::Models::Trip
  end

  it 'results in a trip with updated information' do
    expect(action.result.name).to eql 'Antarctic Expedition'
    expect(action.result.start_date).to eql (Date.today + 1.week)
    expect(action.result.end_date).to eql (Date.today + 2.weeks)
  end
end
