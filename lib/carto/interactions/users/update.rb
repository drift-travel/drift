module Carto
  module Interactions
    module Users
      class Update < Carto::Interactions::Base
        hash :user do
          string :id
          string :email
          string :password
        end

        def execute
          user = User.find(inputs[:user][:id])
          user.update_attributes(inputs[:user])
          user.save

          user
        end
      end
    end
  end
end