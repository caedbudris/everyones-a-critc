class CriticsController < ApplicationController
  def new
    @critic = Critic.new
  end

  def create
    @critic = Critic.new(critic_params)
    if @critic.save
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
    @critic.update(critic_params)
    if @critic.save
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
end
