class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @albums = Album.tagged_with(@tag.name)
  end
end
