class TransactionsController < ApplicationController

  def create
    sender = User.find(tx_params[:user_id])
    if sender.balance < tx_params[:amount].to_i
      flash[:error] = "You cannot overspend your credits"
    else
      @transaction = Transaction.create(tx_params)
      if @transaction.save
        flash[:success] = "Your transaction has been created."
      else 
        flash[:error] = "There was an error with your transaction, please try again"
      end
    end
    redirect_to users_path
  end

  private
    def tx_params
      params.require(:transaction).permit(:user_id, :to_id, :to_type, :amount)
    end
end