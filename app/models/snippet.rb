class Snippet < ActiveRecord::Base
	validates :title, :category, :html, :css, :author_id, presence: true
	validates :title, uniqueness: true

	has_many   :comments, dependent: :destroy
	belongs_to :author, class_name: "User"
	has_many   :user_snippets
	has_many   :favoriters, through: :user_snippets, source: :user, dependent: :destroy
end
