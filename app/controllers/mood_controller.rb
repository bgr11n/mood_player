class MoodController < ApplicationController

  def index
    @mood_list = %w(Alone Angry Calm Confused Depressed Drunk Energetic Excited Hungry Lonely Loved Relaxed)

    if params[:mood]
      tracks = load_tracks_for(params[:mood])
      playlist = []

      tracks.each do |t|
        playlist << Serialize.track(t)
      end
    end
  end

  def load_tracks
    mood = params['mood']
    tracks = HTTParty.get("http://openapi.qa.vocvox.com/api/search/tracks",
      :query => { :genre => Genre.from_mood(mood) },
      :headers => { 'Content-Type' => 'application/json', 'x-api-auth' => ENV['api_key'] })['tracks']

    playlist = []

    tracks.each do |t|
      playlist << Serialize.track(t)
    end

    render json: playlist
  end
end
