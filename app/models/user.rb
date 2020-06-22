class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :name, presence: true
  validates :email, uniqueness: { message: "An account with email %{value} already exists" }, presence: true
  validates :address, presence: true, length: { maximum: 1000 }
  validates :phone, presence: true, length: { is: 10 }
  validates :password, length: { minimum: 8 }
  def self.clerks
    order(:id).where(role: "clerk")
  end

  def self.customers
    order(:id).where(role: "customer")
  end

  def self.category(role)
    if role == "clerk"
      clerks
    else
      customers
    end
  end
end
