require 'httparty'

class Siskel
  attr_reader :title, :rating, :year, :plot, :consensus, :tomato

  def initialize(title, options={})
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&plot=#{options[:plot]}&tomatoes=true")
    @title = @movie['Title']
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
    @tomato = @movie ['tomatoUserMeter']
  end

  def title
    if @title == nil
      @title = "Movie not found!"
    else
      @title
    end
  end

    def consensus
      if @tomato.to_i > 50
        "Thumbs Up"
      else
        "Thumbs Down"
      end
    end
end
