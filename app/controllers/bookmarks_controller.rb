class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # a bookmark needs a list, a movie, and a comment
  end

  def create
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:bookmark])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
      # render 'new.html.erb'
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
