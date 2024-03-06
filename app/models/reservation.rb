class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :time_slot
    belongs_to :hotel

    validates :customer_name, uniqueness: true, presence: { message: "Please provide a customer name." }
    validates :customer_phone, uniqueness: true, presence: { message: "Please provide a customer phone." }
    validates :customer_email, uniqueness: true, presence: { message: "Please provide a customer email." }
    validates :persons_size, presence: { message: "Please provide number of persons." }
    validates :reservation_date, presence: { message: "please select reservation day." }
    accepts_nested_attributes_for :hotel, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :time_slot, reject_if: :all_blank, allow_destroy: true
    after_create :send_whatsapp_notification


    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "customer_email", "customer_name", "customer_phone", "hotel_id", "id", "persons_size", "reservation_date", "time_slot_id", "updated_at", "user_id"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["hotel", "time_slot", "user"]
    end


    def send_whatsapp_notification
        message_body = "Your reservation for #{hotel.name} on #{reservation_date} at #{time_slot.formatted_time_slot} has been successfully created. Thank you!"
        TwilioService.new.send_whatsapp_message(self.customer_phone, message_body)
    end
    
end
