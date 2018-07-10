require 'rails_helper'

describe Client, type: :model do
  subject { Client.new(client_no: "13515153151513")}
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:middle_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:client_no) }
  it { should validate_uniqueness_of(:client_no).case_insensitive }
end
