describe Carto::Decorators::TripDecorator, type: :decorator do
  let(:decorator) { create(:trip).decorate }

  describe '#to_hash' do
    it 'has the correct keys' do
      keys = %w(id user_id name permalink created_at updated_at start_date end_date)

      expect(decorator.to_hash.keys).to match_array keys
    end
  end

  describe '#plans_by_date' do
    let(:plans) { decorator.plans_by_date }

    it 'has a key for every date' do
      expect(decorator.plans_by_date.keys).to eql (decorator.start_date..decorator.end_date).to_a
    end
  end
end
