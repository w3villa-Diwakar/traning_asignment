class Image < ApplicationRecord
	has_one_attached :caption_image
	validates :caption_image,presence: {message: 'can not be empty.'}
	validates :caption,length: {minimum: 3,maximum: 20}
	before_validation :ensure_caption
	belongs_to :user
	private
	def ensure_caption
		if self.caption.blank?
			self.caption = "No caption."
		end
	end
end
