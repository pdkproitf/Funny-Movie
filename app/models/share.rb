class Share < ApplicationRecord
  YOUTUBE_FORMAT_REGEXP = /\Ahttps:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)\Z/

  paginates_per 5
  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  validates_presence_of :title, :description, :url
  validates_format_of :url, with: YOUTUBE_FORMAT_REGEXP, message: 'is not youtube url'
end
