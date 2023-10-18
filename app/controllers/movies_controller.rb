class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def foo
    p "hiya" * 100
  end

  def new
    # @movie = Movie.new 
    # because of the before_action and private set_movie
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }

      format.html
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
  end

  def create
    movie_params = params.require(:movie).permit(:title, :description, :image_url)
    
    @movie = Movie.new(movie_params)

    if @movie.valid?
      @movie.save

      redirect_to movies_url, notice: "Movie created successfully."
    else
      render "new"
    end
  end

  def edit
    # @movie = Movie.find(params.fetch(:id))
    # because of the before_action and private set_movie
  end

  def update
    @movie = Movie.find(params.fetch(:id))

    movie_params = params.require(:movie).permit(:title, :description, :image_url)
    
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie updated successfully."
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end

  private 
  
  def movie_params
    params.require(:movie).permit(:title, :description, :image_url, :released_on)
  end

  def set_movie
    @movie = Movie.find(params.fetch(:id))
  end
end
