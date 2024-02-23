class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def index
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list_id = @list.id
    @bookmark.movie_id = @movie.id
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
