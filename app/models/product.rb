class Product < ActiveRecord::Base

    has_many :reviews
    has_many :users, through: :reviews

    def leave_review user, star_rating, comment
        Review.create(user_id: user.id, product_id: self.id, star_rating: star_rating, comment: comment)
    end

    def print_all_reviews

        self.reviews.each { |review|
            puts "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        }

    end

    def average_rating

        total_rating = 0

        self.reviews.each { |review|
            total_rating += review.star_rating
        }

        total_rating.to_f/self.reviews.count
    
    end
    
end