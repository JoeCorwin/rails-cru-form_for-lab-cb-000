class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(post_params)
    @song.save
    redirect_to song_path(@song)
  end

  def show
    @song =  Song.find(params[:id])
    @genre = Genre.find_by_id(@song.genre_id)
    @artist = Artist.find_by_id(@song.artist_id)
  end

  def edit
    @song =  Song.find(params[:id])
  end

  def update
    @song =  Song.find(params[:id])
    @song.update(post_params)
    redirect_to song_path(@song)
  end

  private

    def post_params
      params.require(:song).permit(:name, :artist_id, :genre_id)
    end


end
