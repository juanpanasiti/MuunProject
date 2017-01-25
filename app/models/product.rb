class Product < ApplicationRecord
  has_many :product_providers
  has_many :providers, through: :product_providers
  before_destroy :delete_relations

  accepts_nested_attributes_for :product_providers, reject_if: :all_blank, allow_destroy: true

  ######## CALLBACKS
  def delete_relations
    pps = ProductProvider.where(product_id: self.id)
    pps.each do |pp|
      pp.delete
    end
  end
  ######## METHODS
  def get_price prov
    prod = self.product_providers.where(provider_id: prov.id).first
    if prod.nil?
      return 'S/D'
    else
      no_iva = prod.price.nil? ? 0.0 : prod.price
      iva = prod.iva.nil? ? 0.0 : prod.iva
      price = no_iva * (iva / 100.0 + 1.0) * (prov.tax / 100.0 + 1.0) * prov.dollar_price
      return price.round(2)
    end
  end
end
