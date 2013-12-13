require 'spec_helper'

describe Movie do

  let(:movie) {Movie.new}
  let(:rotten_finder_return) { OpenStruct.new(ratings: OpenStruct.new(audience_score: 84)) }

  describe "#snippet" do
    context "When description is less than or equal to 50 chars" do
      it "returns the full description" do
        allow(movie).to receive(:description).and_return("Once-general, now-gladiator seeks revenge in arena")

        expect(movie.snippet).to eq "Once-general, now-gladiator seeks revenge in arena"
      end
    end
    context "When description is greater than 50 chars" do
      it "return the first 47 chars and appends ..." do
        allow(movie).to receive(:description).and_return("When a Roman general is betrayed and his family murdered by an emperor's corrupt son, he comes to Rome as a gladiator to seek revenge.")

        expect(movie.snippet).to eq "When a Roman general is betrayed and his family..."
      end
    end
    context "When description is not given" do
      it "returns an empty string" do
        allow(movie).to receive(:description).and_return("")

        expect(movie.snippet).to eq ""
      end
    end
  end

  describe "#audience_rating" do
    context "when Movie is found on Rotten Tomatoes" do
      it "return the audience score for the Movie" do
        allow(movie).to receive(:rotten_finder).and_return(rotten_finder_return)

        expect(movie.audience_rating).to eq 84
      end
    end
    context "When Movie is not found on Rotten Tomatoes" do
      it "returns a message stating the movie could not be found" do
        allow(movie).to receive(:rotten_finder).and_return(nil)

        expect(movie.audience_rating).to eq "Sorry, we could not find your movie."
      end
    end
  end

  describe ".average_rating" do
    let(:movie2) {Movie.new}
    let(:movie3) {Movie.new}

    context "when all movies can be found on Rotten Tomatoes" do
      it "returns the average audience_score for all movies" do
        allow(movie).to receive(:audience_rating).and_return(100)
        allow(movie2).to receive(:audience_rating).and_return(50)
        allow(Movie).to receive(:all).and_return([movie, movie2])

        expect(Movie.average_rating).to eq 75
      end
    end

    context "when some movies are not found on Rotten Tomatoes" do
      it "returns the average audience_score of the movies that were found" do
        allow(movie).to receive(:audience_rating).and_return(100)
        allow(movie2).to receive(:audience_rating).and_return(50)
        allow(movie3).to receive(:audience_rating).and_return(nil)
        allow(Movie).to receive(:all).and_return([movie, movie2, movie3])

        expect(Movie.average_rating).to eq 75
      end
    end

    context "when no movies are found on Rotten Tomatoes" do
      it "returns nil" do
        allow(movie).to receive(:audience_rating).and_return(nil)
        allow(movie2).to receive(:audience_rating).and_return(nil)
        allow(movie3).to receive(:audience_rating).and_return(nil)
        allow(Movie).to receive(:all).and_return([movie, movie2, movie3])

        expect(Movie.average_rating).to eq "There are no ratings"
      end
    end
  end
end
