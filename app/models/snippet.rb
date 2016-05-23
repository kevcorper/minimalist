class Snippet < ActiveRecord::Base
	validates :title, :category, :html, :css, :author_id, presence: true
	validates :title, uniqueness: true

	has_many   :comments
	belongs_to :author, class_name: "User"
	has_many   :user_snippets
	has_many   :favoriters, through: :user_snippets, source: :user

	 def escape_char
  	html = self.html.clone
  	html.gsub!("<", "&lt;")
  	html.gsub!(">", "&gt;")
  end
end
