class User < ActiveRecord::Base
    has_many :arihants
    has_secure_passwords
    before_save {self.email = email.downcase}
   validates :username, presence: true, uniqueness: {case_sensitivity: false},
   length:{minimum: 3, maximum: 25}
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
   validates :email, presence: true, uniqueness:{case_sensitivity: false},
   length:{maximum: 105},
   format: {with: VALID_EMAIL_REGEX}
end