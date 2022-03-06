class ContactsController < ApplicationController
  before_action :get_contact
  
  def index
      @contacts = Contact.all
  end

  def new
      @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
        if @contact.save!
            flash[:success] = 'Contato criado com sucesso!'
        redirect_to contacts_path
        else
             render 'new'
        end
    end

  def edit
      @contact = Contact.find(params[:id])
      if @contact.nil?
          flash[:danger] = 'Contato não encontrado.'
          redirect_to contacts_path(current_user)
      end
  end
  
  def update
      @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
          flash[:success] = 'Contato atualizado com sucesso'
          redirect_to contacts_path
      else
          render 'edit'
      end
  end
  

  def destroy
      @contact = Contact.find(params[:id])
      if @contact.destroy
          flash[:success] = 'Contato removido com sucesso'
          redirect_to contacts_path
      else
          flash[:danger] = 'Contato não encontrado.'
          redirect_to contacts_path(current_user)
      end
  end
  
  def show
      @contact = Contact.find(params[:id])
  end     

  private
      def contact_params
          params.require(:contact).permit(:name, :phone, :user_id)
      end

  def get_contact
      @contact = Contact.find(params[:id]) unless params[:id].blank?
  end
end