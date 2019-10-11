class AccountTransactionCreator
  def initialize(user, amount, note)
    @user = user
    @amount = amount
    @note = note
  end

  def account_transaction
      @account_transaction = AccountTransaction.create(amount: @amount, account: @user.account, note: @note)
  end
end