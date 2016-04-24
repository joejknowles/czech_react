module Seeds
  module TimeSentences
    def self.add_all
    end
    def self.add_first_verb
      VocabCreator.new.create(
        'verbs',
        ['I am', ['jsem']]
      )
    end
  end
end