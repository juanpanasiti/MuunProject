class Provider < ApplicationRecord
  has_many :product_providers
  has_many :products, through: :product_providers
end
