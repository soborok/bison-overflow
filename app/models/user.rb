class User < ActiveRecord::Base
	has_many :answers
	has_many :answered_questions, through: :answers, source: :question
	has_many :questions

	validates_uniqueness_of :email

	def password
		BCrypt::Password.new(self.hashed_password)
	end

	def password=(user_input)
		self.hashed_password = BCrypt::Password.create(user_input)
	end

	def self.authenticate(email, password)
		user = User.find_by(email: email)
		user if user && user.password == password
	end

	def full_name
    "#{first_name} #{last_name}"
  end

end
