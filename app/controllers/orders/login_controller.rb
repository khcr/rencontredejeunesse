class Orders::LoginController < Orders::BaseController

  def new
    @order = order
  end

  def create
    @order = order(order_params)
    if @order.save(context: :order)
      redirect_to confirmation_orders_login_path(@order.order_id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @order.assign_attributes(order_params)
    if @order.save(context: :order)
      redirect_to confirmation_orders_login_path(@order.order_id)
    else
      render 'edit'
    end
  end

  def confirmation
  end

  private

  def order_params
    params.require(:order).permit(:conditions, user_attributes: [
      :id, :firstname, :lastname, :email, :phone, :address, :npa, :city, :country, :newsletter], product_attributes: [
      :id, :entries, :group
    ])
  end

  def order(params = {})
    order = Order.new
    order.user = User.new
    order.product = Records::Login.new
    order.assign_attributes(params)
    return order
  end
end
