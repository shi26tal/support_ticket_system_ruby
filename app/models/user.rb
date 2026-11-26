class User < ApplicationRecord
  has_secure_password

  has_many :agent_categories, foreign_key: "agent_id"
  has_many :categories, through: :agent_categories

  has_many :messages

  # user bata pani janu paryo ni thats user_id can be customer_id if create ticket and assigned_to_id if the ticket is assigned
  # in ticket model these 2 are foreign key
  has_many :created_tickets,
         class_name: "Ticket",
         foreign_key: "customer_id"

  has_many :assigned_tickets,
          class_name: "Ticket",
          foreign_key: "assigned_to_id"

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
