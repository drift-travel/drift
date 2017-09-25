describe Drift::Interactions::Users::Destroy, type: :interaction do
  let(:user) { create(:user) }
  let(:action) do
    Drift::Interactions::Users::Update.run(
      user: {
        id: user.id.to_s
      }
    )
  end

  describe '#execute' do
    it 'results in nil' do
      expect(action.result).to eql nil
    end

    it 'destroys the user' do
      user.reload

      expect(user.persisted?).to eql false
    end
  end
end