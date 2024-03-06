class Hotel < ApplicationRecord
   has_many :reservations
   validates :name, uniqueness: true, presence: { message: "Please provide a hotel name." }

   def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "name", "updated_at"]
   end

   def self.ransackable_associations(auth_object = nil)
      ["reservations"]
  end
end
