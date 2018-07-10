class BankAccountsController < ApplicationController
  before_action :load_bank_account, only: [:show]
  
  def index
    @bank_accounts = BankAccount.all
  end

  def show; end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)
   
    if @bank_account.save
      flash[:success] = "You have successfully added a new bank account"

      redirect_to bank_account_path(@bank_account.id) 
    else
      render :new
    end
  end

  def edit; end

  def update
  end

  def destroy
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(:account_no, :client_id)  
  end

  def load_bank_account
    @bank_account = BankAccount.find(params[:id])
  end
end
