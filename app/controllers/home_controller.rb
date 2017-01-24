class HomeController < ApplicationController
  def index
    @providers = Provider.all
    @products = Product.all
  end

  def about
  end
end
