describe Drift::Models::Trip do
  let(:trip) { create(:trip) }

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
  end
end
