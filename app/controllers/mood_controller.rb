class MoodController < ApplicationController

  def index
    @mood_list = %w(Alone Angry Calm Confused Depressed Drunk Energetic Excited Hungry Lonely Loved Relaxed)

    if params[:mood]
      tracks = load_tracks_for(params[:mood])
      @playlist = []

      tracks.each do |t|
        @playlist << Serialize.track(t)
      end
    end
  end

  private

  def load_tracks_for mood
    tracks = HTTParty.get("http://api.randrmusic.com/api/search/tracks",
      :query => { :genre => Genre.from_mood(mood), :offset => rand(1..3000) },
      :headers => { 'Content-Type' => 'application/json', 'x-api-auth' => ENV['api_key'] })['tracks']
  end
end
