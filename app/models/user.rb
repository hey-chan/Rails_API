class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates_format_of :username, with: /^[^@]+$/, multiline: true, message: "cannot have @ symbol in username"
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  # CUSTOM SCOPE: this gives us the ability to use an email or username to login
  scope :signin, ->(input) { User.where(username: input).or(User.where(email: input)) }
end
