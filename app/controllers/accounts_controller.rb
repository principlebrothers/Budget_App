class AccountsController < ApplicationController
  def index
    @accounts = Account.joins(:groups).where(groups: { id: params[:group_id] })
    # find the name of the group to display on the page
    @group = Group.find(params[:group_id])
  end

  def new
    @account = Account.new
    @group = Group.find(params[:group_id])
  end

  def create
    @account = Account.new(account_params)
    @account.author_id = current_user.id
    @group_account = GroupAccount.new(group_id: params[:group_id], account_id: @account.id)
    @account.group_accounts << @group_account
    if @account.save
      redirect_to group_accounts_path, notice: 'Transaction was successfully created.'
    else
      redirect_to new_group_account_path, alert: 'Something went wrong.'
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :amount)
  end
end
