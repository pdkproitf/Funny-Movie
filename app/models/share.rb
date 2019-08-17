class Share < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  validates_presence_of :title, :description, :url
end
