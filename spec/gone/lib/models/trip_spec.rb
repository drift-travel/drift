describe Gone::Models::Trip do
  let(:trip) { create(:trip) }

  it 'requires a name' do
    expect(trip).to validate_presence_of :name
  end

  it 'belongs to a user' do
    expect(trip).to belong_to :user
  end

  describe '#valid_date_order?' do
    it 'adds an error if end date before start date' do
      trip.start_date = Date.today + 7.days
      trip.end_date = Date.today
      trip.valid?

      expect(trip.errors.messages[:end_date]).to include 'before start date'
    end
  end
end
