class MoodController < ApplicationController
  include Genre

  def index
    @mood_list = %w(Alone Angry Calm Confused Depressed Drunk Energetic Excited Hungry Lonely Loved Relaxed)

    if params[:mood]
      tracks = load_tracks_for(params[:mood])
      @tracks_uris = tracks.map{ |t| t['music_url'] }
    end
  end

  private

  def load_tracks_for mood
    response = HTTParty.get("http://openapi.qa.vocvox.com/api/search/tracks",
      :query => { :genre => Genre.from_mood(mood) },
      :headers => { 'Content-Type' => 'application/json', 'x-api-auth' => ENV['api_key'] })['tracks']
  end
end
