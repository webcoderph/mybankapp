require 'rails_helper'

describe Client, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:middle_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:client_no) }
end
