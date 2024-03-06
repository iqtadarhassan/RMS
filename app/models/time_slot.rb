class TimeSlot < ApplicationRecord
    has_many :reservations
    validates :start_time, presence: { message: "Please select start time." }
    validates :end_time, presence: { message: "Please select end time." }

    def formatted_time_slot
        if start_time.present? && end_time.present?
          "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
        else
          "Unknown Timeslot"
        end
    end

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "start_time", "end_time", "updated_at"]
   end

   def self.ransackable_associations(auth_object = nil)
      ["reservations"]
  end
end
