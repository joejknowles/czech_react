module Seeds
  module Adjectives
    def self.add_all
      add_adjectives1
    end
    def self.add_adjectives1
      VocabCreator.create(
        'adjectives1',
        ['small', 'malý'],
        ['big', 'velký'],
        ['tall', 'vysoký'],
        ['poor', 'chudý'],
        ['rich', 'bohatý'],
        ['thin', ['hubený', 'štihlý']],
        ['fat', 'tlustý'],
        ['healthy', 'zdravý'],
        ['sick', 'nemocný'],
        ['weak', 'slabý'],
        ['strong', 'silný'],
        ['light', 'lehký'],
        ['heavy', 'těžký'],
        ['cold', 'studený'],
        ['hot', 'horký'],
        ['warm', 'teplý'],
        ['young', 'mladý'],
        ['old', 'starý'],
        ['new', 'nový'],
        ['clean', 'čistý'],
        ['dirty', 'špinavý'],
        ['cheap', 'levný'],
        ['expensive', 'drahý'],
        ['beautiful', 'krásný'],
        ['ugly', ['ošklivý', 'škaredý']],
        ['happy', 'veselý'],
        ['sad', 'smutný']
      )
    end
  end
end