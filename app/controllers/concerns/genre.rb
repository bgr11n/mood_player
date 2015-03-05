module Genre
  GENRE_MAP = {
    alone: 'Christian/Gospel',
    angry: 'Rap/Hip Hop',
    calm: 'Folk',
    confused: 'Latin',
    depressed: 'Alternative/Indie',
    drunk: 'Rock',
    energetic: 'Electronica/Dance',
    excited: 'Electronica/Dance',
    hungry: 'Pop',
    lonely: 'World',
    loved: 'Classical/Opera',
    relaxed: 'Jazz'
  }

  def self.from_mood mood
    GENRE_MAP[mood.parameterize.underscore.to_sym]
  end
end
