class OrderItemsController < ApplicationController
  def decrement
    order_item = Order.find(session[:current_order_id]).order_items.find_by(menu_item_id: params[:id])
    if order_item.quantity > 1
      order_item.quantity = order_item.quantity - 1
      order_item.save
    else
      order_item.destroy
    end
    redirect_to menus_path
  end

  def increment
    order_item = Order.find(session[:current_order_id]).order_items.find_by(menu_item_id: params[:id])
    order_item.quantity = order_item.quantity + 1
    order_item.save
    redirect_to menus_path
  end

  def addToCart
    menu_item = MenuItem.find(params[:id])
    OrderItem.create!(order_id: session[:current_order_id], menu_item_name: menu_item.name, menu_item_id: menu_item.id, menu_item_price: menu_item.price, quantity: 1)
    redirect_to menus_path
  end

  def decrementInCart
    order_item = OrderItem.find(params[:id])
    if order_item.quantity > 1
      order_item.quantity = order_item.quantity - 1
      order_item.save
    else
      order_item.destroy
    end
    redirect_to carts_path
  end

  def destroy
    id = params[:id]
    order_item = OrderItem.find(id)
    order_item.destroy
    redirect_to carts_path
  end

  def incrementInCart
    order_item = OrderItem.find(params[:id])
    order_item.quantity = order_item.quantity + 1
    order_item.save
    redirect_to carts_path
  end
end
