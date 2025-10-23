class CartItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end

  def create
    cart = current_cart
    pid = params[:cart_item][:product_id]
    qty = params[:cart_item][:qty].to_i
  
    @product = Product.find(pid)
  
    @cart_item = cart.cart_items.find_by(product_id: pid)
  
    if @cart_item
      @cart_item.qty += qty
    else
      @cart_item = cart.cart_items.new(product_id: pid, qty: qty)
    end
  
    if @cart_item.save
      flash[:notice] = 'カートにアイテムを追加しました'
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id]).destroy
    redirect_to products_path
  end
end
