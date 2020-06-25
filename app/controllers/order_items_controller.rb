class OrderItemsController < ApplicationController
  def change
    order_item = Order.find(session[:current_order_id]).order_items.find_by(menu_item_id: params[:id])
    if params[:quantity].to_i > 0
      if order_item
        order_item.quantity = params[:quantity]
        order_item.save
      else
        menu_item = MenuItem.find(params[:id])
        OrderItem.create!(order_id: session[:current_order_id], menu_item_name: menu_item.name, menu_item_id: menu_item.id, menu_item_price: menu_item.price, quantity: params[:quantity])
      end
    else
      if order_item
        order_item.destroy
      end
    end
    redirect_to menus_path
  end

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
  def incrementInCart
    order_item = OrderItem.find(params[:id])
    order_item.quantity = order_item.quantity + 1
    order_item.save
    redirect_to carts_path
  end

end
