class BankAccount < ApplicationRecord
  belongs_to :client
  has_many :account_transactions

  before_validation :load_defaults
  
  validates :client, presence: true
  validates :account_no, presence: true
  validates :balance, presence: true 
  validates_uniqueness_of :account_no, case_sensitive: false
  validates_numericality_of :balance

  def to_s
    account_no
  end
  
  private

  def load_defaults
    self.balance = 0.00 if self.new_record?
  end

end
