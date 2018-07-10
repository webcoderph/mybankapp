class Client < ApplicationRecord
  before_save :format_name

  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :client_no, presence: true
  validates_uniqueness_of :client_no, case_sensitive: false

  has_many :bank_accounts

  def to_s
    "#{last_name}, #{first_name} #{middle_name}"
  end

  private

  def format_name
    self.first_name  = self.first_name.upcase unless self.first_name.nil?
    self.last_name   = self.last_name.upcase unless self.first_name.nil?
    self.middle_name = self.middle_name.upcase unless self.middle_name.nil?
  end
end
