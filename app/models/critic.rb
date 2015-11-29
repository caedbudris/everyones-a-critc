class Critic < ActiveRecord::Base
    validates(:name, presence: true, length: { maximum: 30 })
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }) #uniqueness: { case_sensitive: false }
    validates(:password, length: { minimum: 6 })
    
    has_secure_password
    
    #before_save :downcase_email
    
    #def downcase_email
    #    self.email = email.downcase!
    #end
    
    def Critic.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
