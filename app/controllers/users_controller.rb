class UsersController < ApplicationController
  before_action :get_user
  
  def index
      @user =  User.all
  end

  def new
      @user = User.new
  end

  def create
  end

  def edit
      @user = User.find(params[:id])
      if @user.nil?
          flash[:danger] = 'Contato não encontrado.'
          redirect_to users_path(current_user)
      end
  end
  
  def update
  end
  

  def destroy
  end
  
  def show
      @user = User.find(params[:id])
  end     

  def list_contacts
      @contacts = Contact.where(user: @user)
  end

  private
      def user_params
          params.require(:users).permit(:name, :phone)
      end

  def get_user
      @user = User.find(params[:id]) unless params[:id].blank?
  end
end