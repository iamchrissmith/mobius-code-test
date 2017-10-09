class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.create(tx_params)
    @transaction.with_lock('FOR SHARE') do
      if @transaction.save
        flash[:success] = "Your transaction has been created."
      else 
        flash[:danger] = @transaction.errors.values[0].join("\n")
      end
    end
    redirect_to users_path
  end

  private
    def tx_params
      params.require(:transaction).permit(:to_id, :to_type, :amount).merge(user_id: current_user.id)
    end
end