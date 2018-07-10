class AccountTransaction < ApplicationRecord
  belongs_to :bank_account
  
  before_validation :load_defaults

  TRANSACTION_TYPES = ["withdraw", "deposit"]
  
  validates :bank_account, presence: true
  validates :amount, presence: true
  validates :transaction_type, presence: true, inclusion: {in: TRANSACTION_TYPES}
  validates :transaction_no, presence: true
  validates_uniqueness_of :transaction_no

  private

  def load_defaults
    self.transaction_no = SecureRandom.uuid if self.new_record?
  end
end
