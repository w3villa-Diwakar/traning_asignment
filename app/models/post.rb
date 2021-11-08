class Post < ApplicationRecord
	validates :title,presence: {message: "Must exist"},length: {minimum: 3,maximum: 25}
	before_save :ensure_description_value

	private
		def ensure_description_value
			self.description = "description is not provided yet."
		end
end