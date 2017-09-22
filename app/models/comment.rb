class Comment < ApplicationRecord
			belongs_to :blog
			validates :comment_text, presence: true, length: { maximum: 20,
    too_long: "%{count} characters is the maximum allowed" }

end
