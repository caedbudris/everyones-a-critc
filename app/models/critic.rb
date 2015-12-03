class Critic < ActiveRecord::Base
    validates(:name, presence: true, length: { maximum: 30 })
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }) #uniqueness: { case_sensitive: false }
    validates(:password, length: { minimum: 6 })
    
    has_secure_password
    
    has_many :favorites, dependent: :destroy
    has_many :movies, through: :favorites
    has_many :reviews
    
    #before_save :downcase_email
    
    #def downcase_email
    #    self.email = email.downcase!
    #end
    
    def Critic.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    def favorite(movie)
        favorites.create(movie_id: movie.id)
    end
    
    #def un_favorite(movie)
    #    favorites.find_by(movie_id: movie.id).destroy
    #end
    
    def favorite?(movie)
        favorite = favorites.find_by(movie_id: movie.id)
        if favorite.nil?
            return false
        else
            return true
        end
        #favorites.include?(movie)
    end
    
end
