class TwitchindicesController < ApplicationController
  def index
    @twitchindices = Twitchindex.all
  end
  def create
    @twitchindex = Twitchindex.new(twitchindex_params)

    @twitchindex.save
    redirect_to @twitchindex
  end
  def new
    @twitchindex = Twitchindex.new 
  end
  def show
    @twitchindex = Twitchindex.find(params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
    def twitchindex_params
      params.require(:twitchindex).permit(:name)
    end

end
