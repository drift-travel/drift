module Drift
  module Interactions
    module Users
      class Create < Drift::Interactions::Base
        hash :user do
          string :email
          string :password
        end

        def execute
          user = User.new(inputs[:user])
          user.save

          user
        end
      end
    end
  end
end