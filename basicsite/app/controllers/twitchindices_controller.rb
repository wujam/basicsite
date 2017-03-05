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
    @twitchindex = getUserInfo(Twitchindex.find(params[:id]).name)
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
    def getUserInfo(streamer)
      response = Unirest.get "https://api.twitch.tv/kraken/users?login=#{streamer}",
                 	headers:{"Accept" => "application/vnd.twitchtv.v5+json", "Client-ID" => "77u9uoixaequar58v12yee12iyaod9"}

      return "Response code: #{response.code}\n\nHeaders: #{response.headers}\n\nResponse Body: #{response.body}"
  end

end
