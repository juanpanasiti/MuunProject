class ProvidersController < ApplicationController
  before_action :set_provider, only: [:update, :edit, :destroy]
  def new
    @provider = Provider.new
  end
  def create
    @provider = Provider.new(provider_params)
    respond_to do |format|
      if @provider.save
        format.html { redirect_to root_path, notice: 'Proveedor agregado.'}
      else
        format.html { render :new }
      end
    end


  end
  def edit
  end

  def update
    respond_to do |format|
      if @provider.update_attributes(provider_params)
        format.html { redirect_to root_path, notice: 'Proveedor actualizado.' }
      else
        format.html { render :edit }
      end
    end
  end

  protected

  def provider_params
    params.require(:provider).permit(:name, :web, :address, :gmaps_link, :dollar_price, :tax)
  end
  def set_provider
    @provider = Provider.find(params[:id])
  end
end
