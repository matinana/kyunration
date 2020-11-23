class Content < ApplicationRecord
  belongs_to :curator

  has_many :content_tags, dependent: destory
end
