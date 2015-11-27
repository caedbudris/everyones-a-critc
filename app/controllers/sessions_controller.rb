class SessionsController < ApplicationController
  def new
  end
  
  def create
    critic = Critic.find_by(email: params[:session][:email])
    if critic && critic.authenticate(params[:session][:password])
      log_in(critic)
      redirect_to critic
    else
      render 'new'
    end
  end
  
  def destroy
    logout
    redirect_to root_url
  end

end
