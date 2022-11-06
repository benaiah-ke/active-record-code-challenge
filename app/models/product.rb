class Product < ActiveRecord::Base

    has_many :reviews
    has_many :users, through: :reviews

    def leave_review user, star_rating, comment

        Review.create(user_id: user.id, product_id: self.id, star_rating: star_rating, comment: comment)

    end
    
end