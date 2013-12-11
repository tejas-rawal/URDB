class ShowtimesController < ApplicationController
  
  def index
    @movie = Movie.find(params[:movie_id])
    showtimes = @movie.showtimes
    @showtimes = showtimes.time.to_ary
    @showtimes.sort {|x, y| x <=> y}
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @showtime = @movie.showtimes.new(showtime_params)

    if @showtime.save
      redirect_to @showtime.movie, notice: 'Showtime was successfully created.'
    else
      redirect_to @showtime.movie, alert: 'Showtime was not successfully created'
    end
  end

  protected
  def showtime_params
    params.require(:showtime).permit(:location, :time, :movie_id)
  end
end
