class DomainsController < ApplicationController

  def index
    @domains = Domain.all
  end

  def new
    @domain = Domain.new()
  end

  def create
    @domain = Domain.new(domain_params)

    if @domain.save
      redirect_to domains_path
    else
      render 'new'
    end
  end

  private
    def domain_params
      params.require(:domain).permit(:name, :description)
    end
end
