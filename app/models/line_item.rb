class LineItem < ActiveRecord::Base
  belongs_to :product_id
  belongs_to :cart_id
  attr_accessible :cart_id, :product_id
end
