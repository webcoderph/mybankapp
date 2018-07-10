require "rails_helper"

describe AccountTransaction, type: :model do
  subject { AccountTransaction.new(transaction_no: "1351513")}

  it { should validate_presence_of(:bank_account) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:transaction_type) }
  it do
    should validate_inclusion_of(:transaction_type).in_array(['withdraw', 'deposit'])
  end

end
