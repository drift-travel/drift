describe Carto::Models::Plans::Activity, type: :model do
  let(:activity) { create(:activity) }

  around(:each) do |example|
    Timecop.freeze(Time.now, &example)
  end

  it 'inherits from Plan' do
    expect(activity).to be_kind_of Carto::Models::Plan
  end

  describe '#set_canonical_times' do
    it 'sets the canonical start to the start time' do
      expect(activity.canonical_start).to eql activity.start_time
    end

    it 'sets the canonical end to the end time' do
      expect(activity.canonical_end).to eql activity.end_time
    end
  end
end
