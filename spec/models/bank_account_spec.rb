require 'rails_helper'

describe BankAccount, type: :model do
  subject { BankAccount.new(account_no: "sag1351513135", balance: 0.00)}
  it { should validate_presence_of(:client) }
  it { should validate_presence_of(:account_no) }
  it { should validate_uniqueness_of(:account_no).case_insensitive }
end
