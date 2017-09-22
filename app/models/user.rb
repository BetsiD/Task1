class User < ApplicationRecord
	has_many :blogs

	validates :name, presence: {message: "Please enter your name"},format: { with: /\A[ a-z.A-Z]+\z/,
    message: "Please enter a valid name" }
	validates :contact, presence: {message: "Please enter your contact details"},numericality: { only_integer: true },length: { is: 10 }
	validates :address, presence: {message: "Please enter your address"}

	before_validation :caps_name
	private
    def caps_name
      self.name = name.capitalize
    end
end
