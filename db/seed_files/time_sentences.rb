module Seeds
  module TimeSentences
    def self.add_all
      add_months
      add_days
    end
    def self.add_months
      VocabCreator.new.create(
        'months',
        ['january', ['leden']],
        ['february', ['únor']],
        ['march', ['březen']],
        ['april', ['duben']],
        ['may', ['květen']],
        ['june', ['červen']],
        ['july', ['červenec']],
        ['august', ['srpen']],
        ['september', ['září']],
        ['october', ['říjen']],
        ['november', ['listopad']],
        ['december', ['prosinec']]
      )
    end

    def self.add_days
      VocabCreator.new.create(
        'days',
        ['Monday', ['pondělí']],
        ['Tuesday', ['úterý']],
        ['Wednesday', ['středa']],
        ['Thursday', ['čtvrtek']],
        ['Friday', ['pátek']],
        ['Saturday', ['sobota']],
        ['Sunday', ['neděli']]
      )
    end
  end
end