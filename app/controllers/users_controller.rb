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
          flash[:danger] = 'Usuário não encontrado.'
          redirect_to users_path(current_user)
      end
  end
  
  def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = 'Usuário atualizado com sucesso'
            redirect_to users_path
        else
            render 'edit'
        end
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
          params.require(:user).permit(:name, :phone, :user_id)
      end

  def get_user
      @user = User.find(params[:id]) unless params[:id].blank?
  end
end