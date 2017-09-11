module Gone
  module Models
    class User
      include Mongoid::Document

      field :email, type: String

      validates :email, presence: true, format: /@/
    end
  end
end
