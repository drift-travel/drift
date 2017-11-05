describe Carto::Models::Plans::Flight, type: :model do
  let(:flight) { create(:flight) }

  around(:each) do |example|
    Timecop.freeze(Time.now, &example)
  end

  describe '#set_canoncial_times' do
    it 'sets the canonical start' do
      expect(flight.canonical_start).to eql flight.departure_time
    end

    it 'sets the canonical end' do
      expect(flight.canonical_end).to eql flight.arrival_time
    end
  end
end
