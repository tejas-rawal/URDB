class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles

  validates :title, presence: true

  def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end
  
  def snippet
    description.truncate 50
  end

  def audience_rating
    if rotten_finder
      rotten_finder.ratings.audience_score
    else
      return "Sorry, we could not find your movie."
    end
  end

  def self.average_rating
    scores = self.all.map do |movie|
      movie.audience_rating
    end
    scores.compact!
    if scores.length > 0
      return (scores.sum / (scores.length))
    else
      return "There are no ratings"
    end
  end
end
