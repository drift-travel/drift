describe Carto::Interactions::Users::Create, type: :interaction do
  let(:email) { generate(:email) }
  let(:action) do
    Carto::Interactions::Users::Create.run(
      user: {
        email: email,
        password: 'hello1234'
      }
    )
  end

  describe '#execute' do
    it 'results in a user' do
      expect(action.result).to be_a Carto::Models::User
    end

    it 'results in a user with the correct information' do
      expect(action.result.email).to eql email
    end
  end
end