class PostImage < ApplicationRecord
	belongs_to :user
	sttachment :image
end
