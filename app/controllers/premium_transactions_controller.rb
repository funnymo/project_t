class PremiumTransactionsController < ApplicationController
  before_action :authenticate_user!, except: [:notifypremium]

  def create
    @user = current_user
    @transaction = @user.premium_transactions.create(transaction_params)
    if @transaction
      values = {
        business: 'mky.wee-facilitator@gmail.com',
        cmd: '_xclick',
        upload: 1,
        notify_url: 'http://projecttrail.herokuapp.com/notifypremium',
        amount: 0,
        item_name: "Premium Tee",
        item_number: @transaction.id,
        item_price: '0',
        quantity: '1',
        return: 'http://projecttrail.herokuapp.com/'
      }
      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      redirect_to @transaction.user, alert: "Your transaction can't be made.."
    end
  end

  protect_from_forgery except: [:notifypremium]
  def notifypremium
    params.permit!
    status = params[:payment_status]
    transaction = PremiumTransaction.find(params[:item_number])
    if status == "Completed"
      flash[:alert] = "Transaction Complete!"
      @user = transaction.user
      @user.update_attributes premium: true
      @user.update_attributes code: transaction.premium
    else
      transaction.destroy
    end
    render nothing: true
  end

  private
  def transaction_params
    params.require(:premium_transaction).permit(:user_id, :premium, :price)
  end
end
