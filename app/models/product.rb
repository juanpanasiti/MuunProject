class Product < ApplicationRecord
  has_many :product_providers
  has_many :providers, through: :product_providers

  accepts_nested_attributes_for :product_providers
end
