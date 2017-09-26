class Blog < ApplicationRecord
	has_many :comments
	belongs_to :user 
	validates :title, presence: {message: "Please fill the title"}
	validates :description, presence: {message: "Please enter your content"}, length: { maximum: 1500, too_long: "%{count} characters is the maximum allowed"}
	validates :user_id, presence: {message: "Select a user"}
	before_validation :caps_name
	private
    def caps_name
      self.title = title.capitalize
      self.description = description.capitalize
    end
end
