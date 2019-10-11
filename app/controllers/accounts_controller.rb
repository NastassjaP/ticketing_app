class AccountsController < ApplicationController

  def show 
    @account = current_user.account
    @transactions = @account.account_transactions
  end
end
