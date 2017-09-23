require 'bcrypt'

module Drift
  module Models

    # The main user model.
    class User
      include Mongoid::Document
      include Mongoid::Timestamps

      include Drift::Concerns::Decoratable

      store_in collection: 'users'

      # The plain text password to encrypt.
      attr_accessor :password

      field :email, type: String
      field :password_hash, type: String
      field :password_salt, type: String
      field :api_key, type: String
      field :api_secret, type: String

      validates :email, presence: true, uniqueness: true, format: /@/
      validates :password, presence: true, length: { minimum: 6 }, on: :create

      has_many :trips

      before_create :encrypt_password!, :generate_api_credentials!
      before_update :encrypt_password!, if: -> { password }

      # Returns a user matching the credentials given.
      #
      # @param [String] _email The user's email.
      # @param [String] _password The user's password.
      # @return [Gone::Models::User, nil] The matching user or nil.
      def self.authenticate(_email, _password)
        user = User.find_by(email: _email)

        return nil unless user

        return nil unless user.password_matches?(_password)

        user
      end

      # Returns a user matching the API credentials given.
      #
      # @param [String] _key The user's API key.
      # @param [String] _secret The user's API secret.
      # @return [Gone::Models::User, nil] The matching user or nil.
      def self.api_authenticate(_key, _secret)
        User.where(api_key: _key, api_secret: _secret).first
      end

      # Checks if the given password matches the user's passwod.
      #
      # @param [String] _password The password to check.
      # @return [TrueClass,FalseClass] Whether the password matches or not.
      def password_matches?(_password)
        password_hash == BCrypt::Engine.hash_secret(_password, password_salt)
      end

      private

      # Encrypts the password given.
      #
      # @return [void]
      def encrypt_password!
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = password.blank? ? nil : BCrypt::Engine.hash_secret(password, self.password_salt)
      end

      # Generates random API credentials.
      #
      # @return [void]
      def generate_api_credentials!
        self.api_key = SecureRandom.hex(16)
        self.api_secret = SecureRandom.hex(16)
      end
    end
  end
end
