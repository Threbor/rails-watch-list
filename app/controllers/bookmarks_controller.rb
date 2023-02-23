class BookmarksController < ApplicationController

  # before_action :set_bookmark, only: %i[destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = List.find(params[:list_id]).id

    if @bookmark.save
      redirect_to list_path(params[:list_id]), notice: "Bookmark was successfully created."
    else
      # render :show, status: :unprocessable_entity
      redirect_to list_path(params[:list_id]), status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
    redirect_to list_path
  end

  private

  def set_bookmark
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id, :comment)
  end
end
