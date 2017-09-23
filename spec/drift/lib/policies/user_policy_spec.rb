require 'spec_helper'

describe Drift::Policies::UserPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:matching) { subject.new(user, user) }
  let(:nonmatching) { subject.new(build(:user), user) }

  describe '#index?' do
    it 'always returns false' do
      expect(matching.index?).to eql false
      expect(nonmatching.index?).to eql false
    end
  end

  describe '#show?' do
    it 'returns true for the same user' do
      expect(matching.show?).to eql true
    end

    it 'returns false for different users' do
      expect(nonmatching.show?).to eql false
    end
  end

  describe '#edit?' do
    it 'returns true for the same user' do
      expect(matching.edit?).to eql true
    end

    it 'returns false for different users' do
      expect(nonmatching.edit?).to eql false
    end
  end

  describe '#update?' do
    it 'returns true for the same user' do
      expect(matching.update?).to eql true
    end

    it 'returns false for different users' do
      expect(nonmatching.update?).to eql false
    end
  end

  describe '#destroy?' do
    it 'returns true for the same user' do
      expect(matching.destroy?).to eql true
    end

    it 'returns false for different users' do
      expect(nonmatching.destroy?).to eql false
    end
  end

  describe Drift::Policies::UserPolicy::Scope do
    let(:scope) { described_class.new(user, Drift::Models::User) }

    describe '#resolve' do
      it 'scopes to just the current user' do
        expect(scope.resolve.selector).to eql({ '_id' => user.id })
        expect(scope.resolve).to include user
      end
    end
  end
end