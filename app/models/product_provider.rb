class ProductProvider < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :provider
end
