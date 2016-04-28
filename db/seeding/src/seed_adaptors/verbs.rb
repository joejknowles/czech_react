require './app/src/lesson_input/vocab_creator'
module Seeds
  module Verbs
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