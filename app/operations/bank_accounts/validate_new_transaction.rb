module BankAccounts
  class ValidateNewTransaction
    def initialize(amount, transaction_type, bank_account_id)
      @amount           = amount.try(:to_f)
      @transaction_type = transaction_type
      @bank_account_id  = bank_account_id
      @bank_account     = BankAccount.where(id: @bank_account_id).first
      @errors = []
    end

    def execute!
      validate_account!
      validate_amount!

      if @transaction_type == "withdraw" and @bank_account.present?
        validate_withdrawal!
      end

      @errors
    end

    private
    
    def validate_amount!
      if @amount < 1 and @bank_account.present?
        @errors << "Invalid amount!"
      end
    end

    def validate_withdrawal!
      if @bank_account.balance - @amount < 0.00
        @errors << "Not enough funds"
      end 
    end

    def validate_account!
      if @bank_account.blank?
        @errors << "Account not found"
      end
    end
  end
end
