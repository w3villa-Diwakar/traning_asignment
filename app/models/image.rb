class Image < ApplicationRecord
	has_one_attached :caption_image
	belongs_to :user
	has_many :comments,as: :commentable
	has_many :categorizes,as: :categorizable
	has_many :categories,through: :categorizes
	accepts_nested_attributes_for :categories,allow_destroy: true

	validates :caption_image,presence: {message: 'can not be empty.'}
	validates :caption,length: {minimum: 3,maximum: 20}

	before_validation :ensure_caption
	after_validation :set_image_slug
  	def to_param
  		"#{id}-#{slug}"
  	end
	private
	def ensure_caption
		if self.caption.blank?
			self.caption = "No caption."
		end
	end
	def set_image_slug
		self.slug = self.caption[0..6].to_s.parameterize
	end
end
