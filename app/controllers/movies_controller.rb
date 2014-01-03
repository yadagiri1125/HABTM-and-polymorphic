class MoviesController < ApplicationController
  include FilmFan::Commentable
  
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
  def new
    @movie=Movie.new

  end

  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Post was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end


end
