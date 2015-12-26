class CartDetailsController < ApplicationController
  def update
    cart_detail = OrderDetail.find_by(id: params[:id], order_id: session[:cart_id])
    if cart_detail.present?
      if cart_detail.update_attributes(cart_detail_params)
        flash[:notice] = "Order is updated successfully"
      else
        flash[:alert] = order_detail.errors.full_messages.to_sentence
      end
    end
    redirect_to :back
  end

  def destroy
    order_detail = OrderDetail.find_by(id: params[:id], order_id: session[:cart_id])
    if order_detail.present?
      if order_detail.destroy
        flash[:notice] = "order is deleted successfully"
      else
        flash[:alert] = order_detail.errors.full_messages.to_sentence
      end
    end
    redirect_to carts_path
  end

  private
  def cart_detail_params
    params.require(:order_detail).permit(:quantity)
  end
end
