module Carto
  module Interactions
    module Users
      class Destroy < Carto::Interactions::Base
        object :current_user, class: Carto::Models::User
        hash :user do
          string :id
        end

        def execute
          user = Carto::Models::User.find(inputs[:user][:id])

          return not_found!(:user) unless user

          return not_authorized! unless current_user.can?(:update, user)

          user.destroy

          user
        end
      end
    end
  end
end
