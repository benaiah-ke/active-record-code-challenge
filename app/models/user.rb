class User < ActiveRecord::Base

    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product

        self.products.find { |product|
            product.reviews.star_rating == self.products.maximum(:star_rating)
        }


    end
    
end