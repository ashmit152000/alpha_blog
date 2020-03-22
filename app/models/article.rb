class Article < ApplicationRecord

	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories

	

    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates_presence_of :description
    validates_length_of :description, minimum: 25, maximum: 350
    validates_presence_of :user_id
      

end