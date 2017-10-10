describe Carto::Interactions::Users::Destroy, type: :interaction do
  let(:user) { create(:user) }
  let(:action) do
    described_class.run(
      current_user: user,
      user: {
        id: user.id.to_s
      }
    )
  end

  context 'with non-existent trip' do
    let(:action) do
      described_class.run(
        current_user: user,
        user: {
          id: 'foobar'
        }
      )
    end

    it 'adds a not found error' do
      expect(action.errors.details[:user]).to eql [{ error: 'not found' }]
    end
  end

  context 'with unauthorized user' do
    let(:action) do
      described_class.run(
        current_user: create(:user),
        user: {
          id: user.id.to_s
        }
      )
    end

    it 'adds a not authorized error' do
      expect(action.errors.details[:current_user]).to eql [{ error: 'not authorized' }]
    end
  end

  it 'results in a user' do
    expect(action.result).to be_a Carto::Models::User
  end

  it 'results in a destroyed user' do
    expect(action.result.persisted?).to eql false
  end
end
