class User < ApplicationRecord
	has_many :blogs
	has_many :comments
	validates :email, presence: {message: "Please fill the title"}
	validates :comment_text, presence: true, length: { minimum: 8,
    too_short: "Enter 8 characters" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
