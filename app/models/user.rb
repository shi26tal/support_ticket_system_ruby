class User < ApplicationRecord
  has_secure_password

  # hash based enum
  # Rails enum restricts the role to the defined values.
  enum :role, {
    customer: "CUSTOMER",
    admin: "ADMIN",
    agent: "AGENT"
  }, default: "CUSTOMER"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
