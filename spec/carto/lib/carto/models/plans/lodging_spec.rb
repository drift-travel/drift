describe Carto::Models::Plans::Lodging, type: :model do
  let(:lodging) { create(:lodging) }

  describe '#set_canonical_times' do
    it 'sets the canonical start to the start time' do
      expect(lodging.canonical_start).to eql lodging.arrival_time
    end

    it 'sets the canonical end to the end time' do
      expect(lodging.canonical_end).to eql lodging.departure_time
    end
  end
end
