class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @albums = []
      @users = []
      @tags = []
    else
      @albums = Album.search params[:q]
      @users = User.search params[:q]
      @tags = Tag.search params[:q]
    end
  end
end
