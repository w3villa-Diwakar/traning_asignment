class Post < ApplicationRecord
	belongs_to :user
	has_many :comments,as: :commentable
	has_many :categorizes,as: :categorizable
	has_many :categories,through: :categorizes
	accepts_nested_attributes_for :categorizes, allow_destroy: true, reject_if: proc {|attr| attr[:category_id].nil? }

	validates :title, length: {minimum: 3,maximum: 25},uniqueness: {message: "Must be unique."}
	validates_presence_of :title,:description,:slug

	before_validation :set_post_slug

	def to_param
		"#{id}-#{slug}"
	end

	private
	
	def set_post_slug
		self.slug = self.title.to_s.parameterize
	end
		
end