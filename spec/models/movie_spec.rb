require 'spec_helper'

describe Movie do

  let(:movie) {Movie.new}

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
  end
end
