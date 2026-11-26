class Ticket < ApplicationRecord
  belongs_to :customer, class_name: "User"
  belongs_to :assigned_to, class_name: "User", optional: true
  belongs_to :category

  has_many :messages

  enum :status, {
    open: "OPEN",
    in_progress: "IN_PROGRESS",
    pending: "PENDING",
    resolved: "RESOLVED",
    closed: "CLOSED"
  }, default: "OPEN"

  validates :subject, presence: true
  validates :description, presence: true
end
