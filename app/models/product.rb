class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  
  # The field's title, description, and image URL are not empty.
  validates :title, :description, :image_url, presence: true
  # The price is a valid number not less than $0.01.
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  # The title is unique among all products.
  validates :title, uniqueness: true
  # The image URL has gif, jpg or png extension.
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\Z}i,
    message:  'must be a URL for GIF, JPG or PNG image.'
  }
  
  def self.latest
    Product.order('updated_at').last
  end
end
