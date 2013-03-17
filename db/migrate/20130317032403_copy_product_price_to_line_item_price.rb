class CopyProductPriceToLineItemPrice < ActiveRecord::Migration
  def up
    # Iterate over all line items
    LineItem.all.each do |line_item|
      # Get product.
      product = line_item.product
      # Update price for line item (price x quantity)
      line_item.price = product.price * line_item.quantity
      # Save line item
      line_item.save!
    end 
  end

  def down
    # Iterate over all line items
    LineItem.all.each do |line_item|
      # Rolling price back to nil
      line_item.price = nil
      # Save line item
      line_item.save!
    end
  end 
end
