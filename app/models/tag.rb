class Tag < ApplicationRecord
	# tags a/several posts
	has_and_belongs_to_many :posts
	# order alphabetically
	default_scope -> { order(name: :asc) }
end
