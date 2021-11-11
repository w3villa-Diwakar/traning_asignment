class Event < ApplicationRecord
	validates :title,presence: {message: "Must exist"},length: {minimum: 3,maximum: 25}
	before_save :ensure_description_value
	validates :location,presence: true
	validates :title,uniqueness: {message: "title must be unique."}
	validates :start_time,presence: true
	validates :end_time,presence: true
	validate :check_datetime
	belongs_to :user
	private
		def ensure_description_value
			self.description = "description is not provided yet."
		end
		def check_datetime
			if self.start_time == self.end_time
				errors.add(:start_time,'cant be equal to ending time.')
			elsif self.start_time > self.end_time
				errors.add(:start_time,'cant be more that ending time.')
			end

		end

end
