class BankAccountsController < ApplicationController
  before_action :load_bank_account, only: [:show]
  
  def index
    @bank_accounts = BankAccount.all
  end

  def show; end

  private

  def load_bank_account
    @bank_account = BankAccount.find(params[:id])
  end
end
