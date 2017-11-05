describe Carto::Fields::TimeWithNamedZone do
  describe '#mongoize' do
    context 'with ActiveSupport::TimeWithZone' do
      let(:time) { Time.new(2018, 4, 1, 12, 0, 0).in_time_zone('Pacific Time (US & Canada)') }
      let(:mongoized) { described_class.mongoize(time) }

      it 'converts time to UTC' do
        expect(mongoized[:time]).to eql Time.utc(2018, 4, 1, 16, 0, 0)
      end

      it 'sets the converted zone' do
        expect(mongoized[:zone]).to eql 'America/Los_Angeles'
      end
    end

    context 'with Time' do
      let(:time) { Time.new(2018, 4, 1, 12, 0, 0, '-07:00') }
      let(:mongoized) { described_class.mongoize(time) }

      it 'converts the time to UTC' do
        expect(mongoized[:time]).to eql Time.utc(2018, 4, 1, 19, 0, 0)
      end

      it 'sets the zone to UTC' do
        expect(mongoized[:zone]).to eql 'UTC'
      end
    end

    context 'with DateTime' do
      let(:time) { DateTime.new(2018, 4, 1, 12, 0, 0, '-07:00') }
      let(:mongoized) { described_class.mongoize(time) }

      it 'converts the time to UTC' do
        expect(mongoized[:time]).to eql Time.utc(2018, 4, 1, 19, 0, 0)
      end

      it 'sets the zone to UTC' do
        expect(mongoized[:zone]).to eql 'UTC'
      end
    end

    context 'with Date' do
      let(:date) { Date.new(2018, 4, 1) }
      let(:mongoized) { described_class.mongoize(date) }

      it 'converts the date to UTC' do
        expect(mongoized[:time]).to eql Time.new(2018, 4, 1, 0, 0, 0, 0)
      end

      it 'sets the zone to UTC' do
        expect(mongoized[:zone]).to eql 'UTC'
      end
    end

    context 'with Hash' do
      let(:hash) do
        {
          time: Time.new(2018, 4, 1, 12, 0, 0).in_time_zone('Pacific Time (US & Canada)'),
          zone: 'America/Los_Angeles'
        }
      end
      let(:mongoized) { described_class.mongoize(hash) }

      it 'sets the time to the hash time' do
        expect(mongoized[:time]).to eql hash[:time]
      end

      it 'sets the zone to UTC' do
        expect(mongoized[:zone]).to eql hash[:zone]
      end
    end
  end

  describe '#demongoize' do
    let(:time) { Time.new(2018, 4, 1, 12, 0, 0).in_time_zone('Pacific Time (US & Canada)') }
    let(:mongoized) { described_class.mongoize(time) }

    context 'with non-hash object' do
      let(:demongoized) { described_class.demongoize(Object.new) }

      it 'returns nil' do
        expect(demongoized).to eql nil
      end
    end

    it 'returns nil with missing key' do
      expect(described_class.demongoize({ zone: 'UTC' })).to eql nil
    end

    it 'returns the time in the correct timezone' do
      expect(described_class.demongoize(mongoized)).to eql time
    end
  end
end
