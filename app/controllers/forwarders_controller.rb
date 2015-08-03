class ForwardersController < ApplicationController
  def index
    if params[:search]
      @forwarders = Forwarder.search(params[:search])
    else
      @forwarders = Forwarder.all
    end
  end

  def show
    @forwarder = Forwarder.find(params[:id])
  end

  def new
    redirect_to new_domain_path if !Domain.first
    @forwarder = Forwarder.new
  end

  def edit
    @forwarder = Forwarder.find(params[:id])
  end

  def create
    @forwarder = Forwarder.new(forwarder_params)

    if @forwarder.save
      redirect_to forwarders_path
    else
      render 'new'
    end
  end

  def update
    @forwarder = Forwarder.find(params[:id])

    if @forwarder.update(forwarder_params)
      redirect_to @forwarder
    else
      render 'edit'
    end
  end

  def destroy
    @forwarder = Forwarder.find(params[:id])
    @forwarder.destroy

    redirect_to forwarders_path
  end

  private
    def forwarder_params
      params.require(:forwarder).permit(:responsible, :name, :domain_id, :goto)
    end

end
