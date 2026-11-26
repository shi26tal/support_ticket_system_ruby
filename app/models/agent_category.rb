class AgentCategory < ApplicationRecord
  belongs_to :agent, class_name: "User"
  belongs_to :category

  # :scope option that you can use to specify one or more attributes that are used to limit the uniqueness check
  # so it limits agent_id only to check uniqueness
  validates :category_id, uniqueness: { scope: :agent_id }
end
