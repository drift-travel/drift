describe Gone::Models::User, type: :model do
  let(:user) { create(:user) }

  it 'requires an email' do
    expect(user).to validate_presence_of :email
  end

  it 'requires a valid email' do
    expect(user).to validate_format_of(:email).to_allow('e@g.com').not_to_allow('e')
  end
end
