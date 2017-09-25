module Drift
  module Interactions
    module Users
      class Destroy < Drift::Interactions::Base
        hash :user do
          string :id
        end

        def execute
          user = User.find(inputs[:user][:id])
          user.destroy

          nil
        end
      end
    end
  end
end