class Product < ActiveRecord::Base

    has_many :reviews
    has_many :users, through: :reviews

    def leave_review user, star_rating, comment

        #Checks for duplicate reviews from the same user and deletes it - a user can only review a specific product once

        duplicate_reviews = self.reviews.select { |review| review.user_id == user.id }
        duplicate_reviews == [] ? "No duplicate reviews for this product" : duplicate_reviews.each { |review| reviews.delete(review) }

        Review.create(user_id: user.id, product_id: self.id, star_rating: star_rating, comment: comment)

    end

    def print_all_reviews

        self.reviews.each { |review|
            puts "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        }

    end

    def average_rating
        self.reviews.average(:star_rating).to_f  
    end

    #Returns a review on an instance of the project class given by a specified user

    def review user_id
        self.reviews.find { |review| review.user_id == user_id }
    end
    
end