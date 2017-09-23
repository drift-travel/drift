require 'spec_helper'

describe Drift::Policies::PlanPolicy, type: :policy do
  subject { described_class }

  let(:plan) { create(:plan) }
  let(:user) { plan.trip.user }
  let(:owner) { subject.new(user, plan) }
  let(:nonowner) { subject.new(build(:user), plan) }

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

  describe Drift::Policies::PlanPolicy::Scope do
    let(:scope) { described_class.new(user, Drift::Models::Plan) }

    describe '#resolve' do
      it 'scopes to the plans belonging to trips owned by the user'
    end
  end
end