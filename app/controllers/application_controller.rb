class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Private makes this method available only to controllers
  # and prevents Rails from making it available as an action
  # on the controller.
  private
  
  def current_cart
    # Retrieve cart_id from session object.
    Cart.find(session[:cart_id])
    # If cart record can not be found
  rescue ActiveRecord::RecordNotFound
    # Create new cart
    cart = Cart.create
    # Store cart_id into session object
    session[:cart_id] = cart.id
    # return new cart
    cart
  end
end
