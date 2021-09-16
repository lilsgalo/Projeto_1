class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]
  
  def index
    @users = User.all
  end

  def show # show user by id // i don't know if it's gonna work tho
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "Novo usuário registrado."
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update user_params
      flash[:notice] = "Usuário atualizado."
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Usuário deletado."
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:nome, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end