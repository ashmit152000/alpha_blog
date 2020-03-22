class Category < ApplicationRecord 
	validates_presence_of :name
	validates_uniqueness_of :name
	validates_length_of :name, :minimum => 3, :maximum => 25

	has_many :article_categories
	has_many :articles, through: :article_categories
end