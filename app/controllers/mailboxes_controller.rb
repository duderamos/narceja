class MailboxesController < ApplicationController
  def index
    if params[:search]
      @mailboxes = Mailbox.search(params[:search])
    else
      @mailboxes = Mailbox.order(created_at: :desc).limit(15)
    end
  end

  def show
    @mailbox = Mailbox.find(params[:id])
  end

  def new
    redirect_to new_domain_path if !Domain.first
    @mailbox = Mailbox.new
  end

  def edit
    @mailbox = Mailbox.find(params[:id])
  end

  def create
    @mailbox = Mailbox.new(mailbox_params)

    require 'digest'
    @pass = random_password
    @mailbox.password = '$5$' + Digest::SHA256.base64digest(@pass)
    if @mailbox.save
      render 'created'
    else
      render 'new'
    end
  end

  def update
    @mailbox = Mailbox.find(params[:id])

    if @mailbox.update(mailbox_params)
      redirect_to @mailbox
    else
      render 'edit'
    end
  end

  def destroy
     @mailbox = Mailbox.find(params[:id])
     @mailbox.destroy

     redirect_to mailboxes_path
  end

  def newpassword
     @mailbox = Mailbox.find(params[:id])

     require 'digest'
     @pass = random_password
     @mailbox.password = '$5$' + Digest::SHA256.base64digest(@pass)
     if @mailbox.save
       render 'newpassword'
     else
       render 'index'
     end
  end

  private
    def mailbox_params
      params.require(:mailbox).permit(:username, :password, :name, :active, :expires, :format_id, :domain_id)
    end

    def random_password
      chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789!@#$'
      password = ''
      8.times { password << chars[rand(chars.size)] }
      password
    end
end
