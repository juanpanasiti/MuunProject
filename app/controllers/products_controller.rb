class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :edit, :destroy]
  before_action :set_providers, only: [:update, :edit, :new, :create]
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'Producto agregado.'}
      else
        format.html { render :new }
      end
    end


  end
  def edit
  end

  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to root_path, notice: 'Producto actualizado.' }
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    respond_to do |format|
      if @product.delete
        format.html { redirect_to root_path, alert: 'Producto eliminado'}
      end
    end

  end

  protected

  def product_params
    params.require(:product).permit(:name, :description, :img_link, providers_ids: [])
  end
  def set_product
    @product = Product.find(params[:id])
  end
  def set_providers
    @providers = Provider.all
  end
end
