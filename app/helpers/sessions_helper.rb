module SessionsHelper
    def log_in(critic)
        session[:critic_id] = critic.id
    end
    
    def current_critic
        if @current_critic.nil?
            @current_critic = Critic.find_by(id: session[:critic_id])
        else
            @current_critic
        end
    end
    
    def logged_in?
        !current_critic.nil?
    end
    
    def logout
        session.delete(:critic_id)
        @current_critic = nil
    end
        
end
