require 'spec_helper'

describe Carto::Policies::TripPolicy, type: :policy do
  subject { described_class }

  let(:trip) { create(:trip) }
  let(:user) { trip.user }
  let(:owner) { subject.new(user, trip) }
  let(:nonowner) { subject.new(build(:user), trip) }

  describe '#show?' do
    it 'returns true for the owner' do
      expect(owner.show?).to eql true
    end

    it 'returns false for a nonowner' do
      expect(nonowner.show?).to eql false
    end
  end

  describe '#edit?' do
    it 'returns true for the owner' do
      expect(owner.edit?).to eql true
    end

    it 'returns false for the nonowner' do
      expect(nonowner.edit?).to eql false
    end
  end

  describe '#update?' do
    it 'returns true for the owner' do
      expect(owner.update?).to eql true
    end

    it 'returns false for a nonowner' do
      expect(nonowner.update?).to eql false
    end
  end

  describe '#destroy?' do
    it 'returns true for the owner' do
      expect(owner.destroy?).to eql true
    end

    it 'returns false for the nonowner' do
      expect(nonowner.destroy?).to eql false
    end
  end

  describe Carto::Policies::TripPolicy::Scope do
    let(:scope) { described_class.new(user, Carto::Models::Trip) }

    describe '#resolve' do
      it 'scopes to the user\'s trips' do
        expect(scope.resolve.selector).to eql({ 'user_id' => user.id })
        expect(scope.resolve).to include trip
      end
    end
  end
end