class TwitchindicesController < ApplicationController
  def index
    @twitchindices = Twitchindex.all
  end
  def create
    @twitchindex = Twitchindex.new(twitchindex_params)

    if @twitchindex.save
      redirect_to @twitchindex
    else
      render 'new'
    end
  end
  def new
    @twitchindex = Twitchindex.new 
  end
  def show
    @twitchindex = Twitchindex.find(params[:id])
  end
  def edit
    @twitchindex = Twitchindex.find(params[:id])
    
    if @twitchindex.update(twitchindex_params)
      redirect_to @twitchindex
    else
      render 'edit'
    end
  end
  def update
  end

  def destroy
    @twitchindex = Twitchindex.find(params[:id])
    @twitchindex.destroy

    redirect_to twitchindices_path
  end
  private
    def twitchindex_params
      params.require(:twitchindex).permit(:name)
    end
    def getUserInfo(streamer)
      response = Unirest.get "https://api.twitch.tv/kraken/users?login=#{streamer}",
                 	headers:{"Accept" => "application/vnd.twitchtv.v5+json", "Client-ID" => "77u9uoixaequar58v12yee12iyaod9"}

      return "Response code: #{response.code}\n\nHeaders: #{response.headers}\n\nResponse Body: #{response.body}"
  end

end
