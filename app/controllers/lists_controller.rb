class ListsController < ApplicationController
  def index
    @lists = List.all
    # the instance of a list.bookmarks is true
  end

  def show
    @list = List.find(params[:id])
    # @movies = Movie.all
    # redirect_to new_list_bookmark(@list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # add movies by id?
    # @movies = Movie.all
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
