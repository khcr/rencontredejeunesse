class Orders::WebhooksController < ApplicationController

  def state_update
    entity_id = params[:entityId]
    space_id = Rails.application.secrets.postfinance_space_id

    # read request
    begin
      transaction_service = PostFinanceCheckout::TransactionService.new
      transaction = transaction_service.read(space_id, entity_id)
    rescue PostFinanceCheckout::ApiError
      head :bad_request
    end

    # update payment
    payment = Payment.find_by!(payment_id: transaction.merchant_reference)
    payment.update(state: transation.state)
    head :ok
  end

  def refund
    # TODO
  end

end
