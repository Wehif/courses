class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = current_user.albums.build(album_params)
    #authorize @album
    if @album.save
      # to handle multiple images upload on create
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end

      flash[:notice] = "Your album has been created."
      redirect_to @album
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    #authorize @album
    if @album.update(album_params)
      # to handle multiple images upload on update when user add more picture
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end

      flash[:notice] = "Album has been updated."
      redirect_to @album
    else
      render :edit
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :description, :images, :visibility, :category_id, :tag_list => [])
    end
end
