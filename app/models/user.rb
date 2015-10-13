class User < ActiveRecord::Base

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :password, :email, presence: true
	validates :email, format: {with: EMAIL_REGEX}

end