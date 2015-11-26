class Critic < ActiveRecord::Base
    validates(:name, presence: true, length: { maximum: 30 })
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }) #uniqueness: { case_sensitive: false }
    validates(:password, length: { minimum: 6 }, allow_nil: true)
    
    has_secure_password
    
    #before_save :downcase_email
    
    #def downcase_email
    #    self.email = email.downcase!
    #end
end
