describe Carto::Models::Trip do
  let(:trip) { create(:trip) }

  it_behaves_like 'decoratable'

  it 'requires a name' do
    expect(trip).to validate_presence_of :name
  end

  it 'requires a user' do
    expect(trip).to validate_presence_of :user
  end

  it 'belongs to a user' do
    expect(trip).to belong_to :user
  end

  it 'has many plans' do
    expect(trip).to have_many :plans
  end

  describe '#valid_date_order?' do
    it 'adds an error if end date before start date' do
      trip.start_date = Date.today + 7.days
      trip.end_date = Date.today
      trip.valid?

      expect(trip.errors.messages[:end_date]).to include 'before start date'
    end
  end

  describe '#generate_permalink!' do
    it 'parameterizes the name' do
      expect(trip.permalink).to include 'trip-to-london'
    end

    context 'if permalink is taken' do
      let(:user) { create(:user) }
      let(:trips) { create_list(:trip, 2, user: user) }

      it 'increments a number on the end of the permalink' do
        expect(trips.last.permalink).to eql 'trip-to-london-1'
      end
    end
  end
end
