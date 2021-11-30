class Category < ApplicationRecord
	has_many :categorizes,dependent: :destroy
	has_many :posts,through: :categorizes,source: :categorizable,source_type: 'Post'
	has_many :images,through: :categorizes,source: :categorizable,source_type: 'Image'
	has_many :events,through: :categorizes,source: :categorizable,source_type: 'Event'
end
