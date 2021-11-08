class Event < ApplicationRecord
	validates :title,presence: {message: "Must exist"},length: {minimum: 3,maximum: 25}
	before_save :ensure_description_value
	validates :location,presence: true
	validates :title,uniqueness: {message: "title must be unique."}
	before_save :check_datetime
	private
		def ensure_description_value
			self.description = "description is not provided yet."
		end
		def check_datetime
			if self.start_time == nil
				self.start_time = '1/1/2021'
			end
			if self.end_time == nil
				self.end_time = '1/1/2021'
			end
		end
end
