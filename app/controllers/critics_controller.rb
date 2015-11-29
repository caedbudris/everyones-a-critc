class CriticsController < ApplicationController
  before_action :logged_in_critic, only: [:edit, :update, :destroy]
  before_action :correct_critic, only: [:edit, :update, :destroy]
  
  def new
    @critic = Critic.new
  end

  def create
    @critic = Critic.new(critic_params)
    if @critic.save
      log_in @critic
      redirect_to @critic
    else
      render 'new'
    end
  end

  def edit
    @critic = Critic.find(params[:id])
  end

  def update
    @critic = Critic.find(params[:id])
    if @critic.update(critic_params)
      redirect_to @critic
    else
      render 'edit'
    end
  end

  def show
    @critic = Critic.find(params[:id])
  end

  def index
    @critics = Critic.all
  end
  
  def destroy
    @critic = Critic.find(params[:id])
    @critic.delete
    redirect_to critics_path
  end
  
  private
    
    def critic_params
      params.require(:critic).permit(:name, :email, :password, :password_confirmation)
    end
    
    def logged_in_critic
      unless logged_in?
        redirect_to login_url
      end
    end
    
    def correct_critic
      @critic = Critic.find(params[:id])
      unless @critic == current_critic
      redirect_to root_url
      end
    end
    
end
