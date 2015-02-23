module Serialize
  def self.track track
    {
      title: track['title'],
      mp3: track['music_url']
    }
  end
end
