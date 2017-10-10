module Carto
  module Interactions
    module Users
      class Create < Carto::Interactions::Base
        hash :user do
          string :email
          string :password
        end

        def execute
          user = User.new(inputs[:user])

          merge_errors!(user)

          user.save

          user
        end
      end
    end
  end
end
