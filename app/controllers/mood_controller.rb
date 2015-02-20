class MoodController < ApplicationController
  respond_to :json

  def index
    @mood_list = %w(Alone Angry Calm Confused Depressed Drunk Energetic Excited Hungry Lonely Loved Relaxed)
    gon.api_key = ENV['api_key']
  end

  def load_tracks
    puts params[:mood]
    response = HTTParty.get("http://openapi.qa.vocvox.com/api/search/tracks",
      :query => { :genre => "Alternative/Indie" },
      :headers => { 'Content-Type' => 'application/json', 'x-api-auth' => ENV['api_key'] })

    respond_with(response.body)
  end
end
