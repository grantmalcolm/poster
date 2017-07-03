class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :taglist, length: { maximum: 30 }
  validate :one_post_per_day

  before_create :set_date_today

  after_create do
  	post = Post.find_by(id: self.id)
  	btags = post.taglist.strip.split(/\s+/)
  	btags.uniq.map do |atag|
  		tag = Tag.find_or_create_by(name: atag)
  		post.tags << tag
  	end
  end

  private
  	def set_date_today
  		self.thedate = Date.current
  	end

  	def one_post_per_day
  		if (! user.posts.empty?) && user.posts.first.thedate == Date.current
  			errors.add(:thedate, "You can post only once per day")
  		end
  	end
end
