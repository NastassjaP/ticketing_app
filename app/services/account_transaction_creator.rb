class AccountTransactionCreator
  def initialize(user, amount, note)
    @user = user
    @amount = amount
    @note = note
  end

  def account_transaction
      @account_transaction = AccountTransaction.create(amount: @amount, account: @user.account, note: @note)
      AccountService.new(@user, @amount).change_account_amount  
  end
end