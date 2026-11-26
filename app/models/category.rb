class Category < ApplicationRecord
  has_many :agent_categories

  # agent_category ma belong to agent xa and class name user xa so source is agent
  has_many :agents, class_name: "User", through: :agent_categories, source: :agent

  # one category has many tickets
  has_many :tickets

  validates :name, uniqueness: true, presence: true
end
