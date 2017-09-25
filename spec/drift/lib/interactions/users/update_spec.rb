describe Drift::Interactions::Users::Update, type: :interaction do
  let(:user) { create(:user) }
  let(:email) { generate(:email) }
  let(:action) do
    Drift::Interactions::Users::Update.run(
      user: {
        id: user.id.to_s,
        email: email,
        password: 'hello1234'
      }
    )
  end

  describe '#execute' do
    it 'results in a user' do
      expect(action.result).to be_a Drift::Models::User
    end

    it 'results in a user with updated information' do
      expect(action.result.email).to eql email
    end
  end
end