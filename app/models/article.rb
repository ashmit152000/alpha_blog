class Article < ApplicationRecord

    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates_presence_of :description
    validates_length_of :description, minimum: 25, maximum: 350

      

end