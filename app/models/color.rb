class Color < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true

	belongs_to :author, class_name: "User"
end
