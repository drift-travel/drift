describe Arrow::Models::User, type: :model do
  let(:user) { create(:user) }

  it 'requires an email' do
    expect(user).to validate_presence_of :email
  end

  it 'requires a unique email' do
    expect(user).to validate_uniqueness_of :email
  end

  it 'requires a valid email' do
    expect(user).to validate_format_of(:email).to_allow('e@g.com').not_to_allow('e')
  end

  it 'has many trips' do
    expect(user).to have_many :trips
  end

  describe '.authenticate' do
    it 'returns the user with the matching email and password' do
      expect(Arrow::Models::User.authenticate(user.email, 'traveler')).to eql user
    end

    it 'returns nil if the email does not exist' do
      expect(Arrow::Models::User.authenticate('foo@bar.com', 'traveler')).to eql nil
    end

    it 'returns nil if the password does not match' do
      expect(Arrow::Models::User.authenticate(user.email, 'foobar')).to eql nil
    end
  end

  describe '.api_authenticate' do
    it 'returns the user with matching api key and secret' do
      expect(Arrow::Models::User.api_authenticate(user.api_key, user.api_secret)).to eql user
    end

    it 'returns nil if api key and secret do not match' do
      expect(Arrow::Models::User.api_authenticate('foo', 'bar')).to eql nil
    end
  end

  describe '#password_matches?' do
    it 'returns true if matching' do
      expect(user.password_matches?('traveler')).to eql true
    end

    it 'returns false if not matching' do
      expect(user.password_matches?('foobar')).to eql false
    end
  end

  describe '#encrypt_password' do
    it 'creates a salt' do
      expect(user.password_salt).to_not be_nil
    end

    it 'hashes the password' do
      expect(user.password_hash).to_not be_nil
    end
  end

  describe '#generate_api_keys!' do
    it 'creates the api key' do
      expect(user.api_key).to_not be_nil
    end

    it 'creates the api secret' do
      expect(user.api_secret).to_not be_nil
    end
  end
end
