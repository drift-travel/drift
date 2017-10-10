describe Carto::Models::Plans::Flight, type: :model do
  let(:flight) { create(:flight) }

  it 'embeds many segments' do
    expect(flight).to embed_many :segments
  end

  describe Carto::Models::Plans::Flight::FlightSegment, type: :model do
    let(:segment) { flight.segments.first }

    it 'is embedded in a flight' do
      expect(segment).to be_embedded_in :flight
    end
  end
end
