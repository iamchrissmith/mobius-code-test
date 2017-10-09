class TransactionsController < ApplicationController

  def create
    current_user.with_lock do 
      @transaction = current_user.transactions.create(tx_params)
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
      params.require(:transaction).permit(:to_id, :to_type, :amount)
    end
end