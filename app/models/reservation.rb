class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :time_slot
    belongs_to :hotel

    accepts_nested_attributes_for :hotel, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :time_slot, reject_if: :all_blank, allow_destroy: true

    validates :customer_name, presence: { message: "Please provide a customer name." }
    validates :customer_phone, presence: { message: "Please provide a customer phone." }
    validates :customer_email, presence: { message: "Please provide a customer email." }


    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "customer_email", "customer_name", "customer_phone", "hotel_id", "id", "persons_size", "reservation_date", "time_slot_id", "updated_at", "user_id"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["hotel", "time_slot", "user"]
    end
end
