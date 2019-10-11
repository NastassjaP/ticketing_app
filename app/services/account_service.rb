class AccountService
  def initialize(user, amount)
    @user = user
    @amount = amount
  end

  def create_account
      @account = Account.create(user: @user, amount: '100.00')

  end

  def change_account_amount
    @account=@user.account
    @curr_bal = (@account.amount).to_i + (@amount).to_i
    @account.update(amount: (@curr_bal) )
  end

end