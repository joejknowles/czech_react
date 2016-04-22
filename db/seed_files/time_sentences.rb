module Seeds
  module TimeSentences
    def self.add_all
      add_months
      add_days
    end
    def self.add_months
      VocabCreator.create(
        'months',
        ['January', 'leden'],
        ['February', 'únor'],
        ['March', 'březen'],
        ['April', 'duben'],
        ['May', 'květen'],
        ['June', 'červen'],
        ['July', 'červenec'],
        ['August', 'srpen'],
        ['September', 'září'],
        ['October', 'říjen'],
        ['November', 'listopad'],
        ['December', 'prosinec']
      )
    end

    def self.add_days
      VocabCreator.create(
        'days',
        ['Monday', 'pondělí'],
        ['Tuesday', 'úterý'],
        ['Wednesday', 'středa'],
        ['Thursday', 'čtvrtek'],
        ['Friday', 'pátek'],
        ['Saturday', 'sobota'],
        ['Sunday', 'neděli']
      )
    end
  end
end