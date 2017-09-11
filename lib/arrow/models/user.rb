module Arrow
  module Models
    class User
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'users'

      attr_accessor :password

      field :email, type: String
      field :password_hash, type: String
      field :password_salt, type: String
      field :api_key, type: String
      field :api_secret, type: String

      validates :email, presence: true, uniqueness: true, format: /@/
      validates :password, presence: true, length: { minimum: 6 }, on: :create

      has_many :trips

      before_create :encrypt_password!, :generate_api_keys!
      before_update :encrypt_password!, if: -> { password }

      def self.authenticate(_email, _password)
        user = User.find_by(email: _email)

        return nil unless user

        return nil unless user.password_matches?(_password)

        user
      end

      def self.api_authenticate(_key, _secret)
        User.where(api_key: _key, api_secret: _secret).first
      end

      def password_matches?(_password)
        password_hash == BCrypt::Engine.hash_secret(_password, password_salt)
      end

      private

      def encrypt_password!
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = password.blank? ? nil : BCrypt::Engine.hash_secret(password, self.password_salt)
      end

      def generate_api_keys!
        self.api_key = SecureRandom.hex(16)
        self.api_secret = SecureRandom.hex(16)
      end

      has_many :trips
    end
  end
end
