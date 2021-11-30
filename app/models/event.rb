class Event < ApplicationRecord
	
	belongs_to :user
  has_many :comments,as: :commentable
  has_many :categorizes,as: :categorizable
	has_many :categories,through: :categorizes
	accepts_nested_attributes_for :categories,allow_destroy: true

	validates :title,presence: {message: "Must exist"},length: {minimum: 3,maximum: 25}
	before_save :ensure_description_value
	validates :location,presence: true
	validates :title,uniqueness: {message: "title must be unique."}
	validates :start_time,presence: true
	validates :end_time,presence: true
	validate :check_datetime

  after_validation :set_event_slug

  def to_param
  	"#{id}-#{slug}"
  end
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
	def set_event_slug
		self.slug = self.title.to_s.parameterize
	end

end
