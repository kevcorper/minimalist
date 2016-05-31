class User < ActiveRecord::Base
	has_secure_password

	validates :username, :email, presence: true, uniqueness: true

	has_many :snippets, dependent: :destroy, foreign_key: :author_id
	has_many :comments, dependent: :destroy, foreign_key: :author_id
	has_many :user_snippets, dependent: :destroy
	has_many :favorites, through: :user_snippets, source: :snippet
	has_many :colors, dependent: :destroy, foreign_key: :author_id


	def has_favorite?(snippet)
		self.favorites.include?(snippet)
	end
end