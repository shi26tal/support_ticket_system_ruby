class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :assigned_to
  belongs_to :category
end
