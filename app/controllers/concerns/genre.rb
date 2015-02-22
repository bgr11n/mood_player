module Genre
  GENRE_MAP = {
    alone: 'Vocals',
    angry: 'Rap/Hip Hop',
    calm: 'Instrumental',
    confused: 'Blues',
    depressed: 'Alternative/Indie',
    drunk: 'Rock',
    energetic: 'Electronica/Dance',
    excited: 'Electronica/Dance',
    hungry: 'Pop',
    lonely: 'Reggae/Ska',
    loved: 'Classical/Opera',
    relaxed: 'Jazz'
  }

  def self.from_mood mood
    GENRE_MAP[mood.parameterize.underscore.to_sym]
  end
end
